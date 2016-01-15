//
//  ViewController.m
//  Wipe-Reveal_Demo
//
//  Created by Marc Liu on 2016/1/15.
//  Copyright © 2016年 6 Neko Studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    IBOutlet UILabel *labelPercentage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MLWipeRevealView *v = [MLWipeRevealView wipeRevealViewWithFrame:CGRectMake(20.0, 100.0, 200.0, 150.0) withBackGroundImage:[UIImage imageNamed:@"bg.jpg"] andImageForWipeOut:[UIImage imageNamed:@"fore.jpg"] delegate:self];
    [self.view addSubview:v];
}
-(void)wipeRevealView:(MLWipeRevealView *)wipeRevealView revealPercentage:(float)revealPercentage{
    labelPercentage.text = [NSString stringWithFormat:@"%f %% revealed", revealPercentage];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
