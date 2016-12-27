//
//  WipeRevealView.h
//  WipeReveal
//
//  Created by Marc Liu on 2016/1/15.
//  Copyright © 2016年 6 Neko Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MLWipeRevealView;



@interface MLWipeRevealView : UIView
@property (copy, nonatomic) void (^percentageCallBack)(double);

+(MLWipeRevealView*)wipeRevealViewWithFrame:(CGRect)frame withBackGroundImage:(UIImage*)backgoundImage andImageForWipeOut:(UIImage*)imageForWipeOut revealPercentageCallBack:(void(^)(double percentage))revealedPercentage;

@end
