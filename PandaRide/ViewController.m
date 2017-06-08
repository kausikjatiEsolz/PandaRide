//
//  ViewController.m
//  Panda Riders
//
//  Created by Rahul Singha Roy on 09/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "ViewController.h"
#import "SignupController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // [self setStatusBarBackgroundColor:[UIColor whiteColor]];
    
    
    sigin_btn.layer.cornerRadius = 3;
    
}


- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)RegisterTap:(UIButton *)sender {
    
    
    SignupController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"signup"];
    
    [self.navigationController pushViewController:obj animated:YES];
    
}

- (IBAction)signinAction:(UIButton *)sender {
}
@end
