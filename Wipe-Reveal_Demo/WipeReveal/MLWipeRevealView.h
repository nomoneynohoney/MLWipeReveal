//
//  WipeRevealView.h
//  WipeReveal
//
//  Created by Marc Liu on 2016/1/15.
//  Copyright © 2016年 6 Neko Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MLWipeRevealView;

@protocol MLWipeRevealViewDelegate <NSObject>
-(void)wipeRevealView:(MLWipeRevealView*)wipeRevealView revealPercentage:(float)revealPercentage;
@end


@interface MLWipeRevealView : UIView
@property (weak, nonatomic) id <MLWipeRevealViewDelegate> delegate;

+(MLWipeRevealView*)wipeRevealViewWithFrame:(CGRect)frame withBackGroundImage:(UIImage*)backgoundImage andImageForWipeOut:(UIImage*)imageForWipeOut delegate:(id<MLWipeRevealViewDelegate>)delegate;
@end
