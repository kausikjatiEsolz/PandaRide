//
//  ViewController.m
//  Panda Riders
//
//  Created by Rahul Singha Roy on 09/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "ViewController.h"
#import "SignupController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // [self setStatusBarBackgroundColor:[UIColor whiteColor]];
    
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


- (IBAction)RegisterTap:(UIButton *)sender {
    
    
    SignupController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"signup"];
    
    [self.navigationController pushViewController:obj animated:YES];
    
}
@end
