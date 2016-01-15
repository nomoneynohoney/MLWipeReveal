//
//  WipeRevealView.m
//  WipeReveal
//
//  Created by Marc Liu on 2016/1/15.
//  Copyright © 2016年 6 Neko Studio. All rights reserved.
//

#import "MLWipeRevealView.h"

@interface MLWipeRevealView ()
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIImage *imageForWipeOut;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *viewForWipeOut;
@end

@implementation MLWipeRevealView {
    CGPoint lastPoint;
    UIImageView *imageViewForWipeOut;
    size_t w;
    size_t h;
}

- (void)drawRect:(CGRect)rect
{
    UIImageView *imgv = [[UIImageView alloc] initWithFrame:self.bounds];
    imgv.contentMode = UIViewContentModeScaleAspectFill;
    imgv.image = self.backgroundImage;
    [self addSubview:imgv];
    imageViewForWipeOut = [[UIImageView alloc] initWithFrame:self.bounds];
    imageViewForWipeOut.contentMode = UIViewContentModeScaleAspectFill;
    imageViewForWipeOut.image = self.imageForWipeOut;
    [self addSubview:imageViewForWipeOut];
    
}

+(MLWipeRevealView*)wipeRevealViewWithFrame:(CGRect)frame withBackGroundImage:(UIImage*)backgoundImage andImageForWipeOut:(UIImage*)imageForWipeOut delegate:(id<MLWipeRevealViewDelegate>)delegate{
    MLWipeRevealView *v = [[MLWipeRevealView alloc] initWithFrame:frame];
    v.delegate = delegate;
    v.backgroundImage = backgoundImage;
    v.imageForWipeOut = imageForWipeOut;
    return v;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self];
    w = CGImageGetWidth(imageViewForWipeOut.image.CGImage);
    h = CGImageGetHeight(imageViewForWipeOut.image.CGImage);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    UIGraphicsBeginImageContext(self.frame.size);
    [imageViewForWipeOut.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 20.0 );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 1.0, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeClear);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageViewForWipeOut.image = UIGraphicsGetImageFromCurrentImageContext();
    [imageViewForWipeOut setAlpha:1.0];
    UIGraphicsEndImageContext();
    if ([self.delegate respondsToSelector:@selector(wipeRevealView:revealPercentage:)]) {
        [self.delegate wipeRevealView:self revealPercentage:ReportAlphaPercent(imageViewForWipeOut.image.CGImage)];
    }
    lastPoint = currentPoint;
}
float ReportAlphaPercent(CGImageRef imgRef)
{
    size_t w = CGImageGetWidth(imgRef);
    size_t h = CGImageGetHeight(imgRef);
    unsigned char *inImage = malloc(w * h * 4);
    memset(inImage, 0, (h * w * 4));
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(inImage, w, h, 8, w * 4, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGContextSetShouldAntialias(context, NO);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), imgRef);
    int byteIndex = 0;
    int alphaCount = 0;
    for(int i=0;i<(w * h);i++) {
        if (inImage[byteIndex + 3]) { // if the alpha value is not 0, count it
            alphaCount++;
        }
        byteIndex += 4;
    }
    free(inImage);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    return 1.0-((float)alphaCount)/(w*h);
}
@end
