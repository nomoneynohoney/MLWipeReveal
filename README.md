# MLWipeReveal
![DEMO GIF] (https://6neko.com/download/b6ZKvx.gif)

A easy setting wipe-reveal view like scratch-offs. 

指定前後圖片即可做出的刮刮樂效果, 並且有Delegate Method可以輕鬆讀出已刮過區域百分比.

### Version
v1.0.5

### Usage

```objective-c

#import "MLWipeRevealView.h"

...

@interface YourViewController : UIViewController <MLWipeRevealViewDelegate>

...

- (void)viewDidLoad {

...
    
    MLWipeRevealView *v = [MLWipeRevealView wipeRevealViewWithFrame:CGRectMake(20.0f, 100.0f, 100.0f, 100.0f) withBackGroundImage:[UIImage imageNamed:@"background.jpg"] andImageForWipeOut:[UIImage imageNamed:@"mask.png"] delegate:self];
    [self.view addSubview:v];
    
    [self.view bringSubviewToFront:labelPercentage];

...

}

...

-(void)wipeRevealView:(MLWipeRevealView *)wipeRevealView revealPercentage:(float)revealPercentage{
    NSLog(@"%.2f", revealPercentage);
}

...

```


### Lisence
The [MIT License] (MIT)

[MIT License]: <https://github.com/nomoneynohoney/MLWipeReveal/blob/master/LICENSE.md>
