## MLWipeReveal

A easy setting wipe-reveal view like scratch-offs. 

指定前後圖片即可做出的刮刮樂效果, 並且可以從callback輕鬆讀出已刮過區域百分比.

![DEMO GIF] (https://6neko.com/download/b6ZKvx.gif)


## Supported Language

Objective C & Swift

## Installation

```ruby
platform :ios, '8.0'

target 'TargetName' do
  pod 'MLWipeReveal', '~> 1.1.0'
end
```

## Usage


objective-c
```objective-c

#import "MLWipeRevealView.h"

...

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MLWipeRevealView *v = [MLWipeRevealView wipeRevealViewWithFrame:[UIScreen mainScreen].bounds withBackGroundImage:[UIImage imageNamed:@"app.jpg"] andImageForWipeOut:[UIImage imageNamed:@"mask.png"] revealPercentageCallBack:^(double percentage) {
        dispatch_async(dispatch_get_main_queue(), ^{
            labelPercentage.text = [NSString stringWithFormat:@"%.2f %% revealed", percentage];
        });
        
    }];
    
    [self.view addSubview:v];
    
    [self.view bringSubviewToFront:labelPercentage];
}

...

```

Swift
``` swift

import UIKit
import MLWipeReveal

class ViewController: UIViewController {

    @IBOutlet weak var lblPercentage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let v = MLWipeRevealView.init(frame: UIScreen.main.bounds, withBackGroundImage: UIImage.init(named: "app.jpg"), andImageForWipeOut: UIImage.init(named: "mask.png")) { (percentage) in
            DispatchQueue.main.async {
                self.lblPercentage.text = NSNumber.init(value: percentage).stringValue
            }
        }
        self.view.addSubview(v!)
        self.view.bringSubview(toFront: lblPercentage)
    }
}

```


### Lisence
The [MIT License] (MIT)

[MIT License]: <https://github.com/nomoneynohoney/MLWipeReveal/blob/master/LICENSE.md>
