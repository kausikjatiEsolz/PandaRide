//
//  BikeListingController.h
//  Panda Riders
//
//  Created by Rahul Singha Roy on 10/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BikeListingCell.h"

@interface BikeListingController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    
    __weak IBOutlet UIView *date_view;
    __weak IBOutlet UITableView *table_Listing;
    
    
    //LeftMenu
    
    __weak IBOutlet UIView *leftMenu;
    __weak IBOutlet UITableView *leftMenuTable;
    
}
- (IBAction)back_Tap:(UIButton *)sender;
- (IBAction)filter:(UIButton *)sender;

@end
