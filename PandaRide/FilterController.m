//
//  FilterController.m
//  Panda Riders
//
//  Created by Rahul Singha Roy on 15/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "FilterController.h"

@interface FilterController ()

@end

@implementation FilterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

- (IBAction)SEARCH:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
@end
