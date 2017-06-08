//
//  ViewController.h
//  Panda Riders
//
//  Created by Rahul Singha Roy on 09/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    __weak IBOutlet UIButton *sigin_btn;
    
}

- (IBAction)RegisterTap:(UIButton *)sender;
- (IBAction)signinAction:(UIButton *)sender;

@end

