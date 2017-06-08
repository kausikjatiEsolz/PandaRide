//
//  SignupController.h
//  Panda Riders
//
//  Created by Rahul Singha Roy on 10/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupController : UIViewController
{
    __weak IBOutlet UIButton *resgiterBtn;
    __weak IBOutlet UIScrollView *_scrollView;
    
    __weak IBOutlet UIImageView *user_image;
    __weak IBOutlet UILabel *last_lbl;
}
- (IBAction)backTosignin:(UIButton *)sender;
- (IBAction)image_upload:(id)sender;
- (IBAction)regiterTap:(UIButton *)sender;

@end
