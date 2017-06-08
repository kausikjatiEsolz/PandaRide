//
//  BikeListingController.m
//  Panda Riders
//
//  Created by Rahul Singha Roy on 10/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "BikeListingController.h"
#import "FilterController.h"

@interface BikeListingController ()
{
    NSArray *menu_Data;
    
    UIView *leftmeu_back;
}

@end

@implementation BikeListingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    menu_Data = [[NSArray alloc]initWithObjects:@"Demo Data",@"Demo Data",@"Demo Data",@"Demo Data",@"Demo Data",@"Demo Data",@"Demo Data", nil];
    
    
    
    leftmeu_back = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    leftmeu_back.backgroundColor = [UIColor blackColor];
    
    leftmeu_back.alpha = 0;
    
    leftmeu_back.hidden =YES;
    
    
    UITapGestureRecognizer *letterTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sideMemuoff)];
    letterTapRecognizer.numberOfTapsRequired = 1;
    [leftmeu_back addGestureRecognizer:letterTapRecognizer];
    
    [self.view addSubview:leftmeu_back];
    
    [self.view bringSubviewToFront:leftMenu];
    
    
    leftMenu.frame = CGRectMake(-leftMenu.frame.size.width, 0, leftMenu.frame.size.width, self.view.frame.size.height);
    
    leftMenu.hidden =YES;
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==table_Listing)
    {
        BikeListingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bikeCell"];
        
        cell.base_view.layer.masksToBounds = NO;
        cell.base_view.layer.shadowOffset = CGSizeMake(0, 0);
        cell.base_view.layer.shadowRadius = 1;
        cell.base_view.layer.shadowOpacity = 0.5;
        cell.base_view.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
        
        return cell;
    }
    else
    {
        static NSString *cellID=@"CellID";
        
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if(cell==nil)
        {
            
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            
        }
        
        
         
        
        
        return cell;
    }
    
   
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView!=table_Listing)
    {
        for (id obj  in cell.subviews)
        {
            [obj removeFromSuperview];
        }
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(tableView.frame.size.width/8, cell.frame.size.height/2 - 20/2, 20, 20)];
        
        imageview.image = [UIImage imageNamed:@"ic_rss_feed_2x"];
        
        [cell addSubview:imageview];
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(imageview.frame.origin.x+imageview.frame.size.width + 15, 0, cell.frame.size.width-(imageview.frame.origin.x+imageview.frame.size.width+15), cell.frame.size.height)];
        
        name.backgroundColor = [UIColor clearColor];
        name.textColor = [UIColor blackColor];
        name.font = [UIFont fontWithName:@"Helvetica" size:14];
        name.text = [menu_Data objectAtIndex:indexPath.row];
        
        [cell addSubview:name];
        UIView *bgColorView = [[UIView alloc] init];
        bgColorView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:.3f];
        [cell setSelectedBackgroundView:bgColorView];
        
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, cell.frame.size.height-1, tableView.frame.size.width, 1)];
        
        line.backgroundColor = [UIColor colorWithRed:(15/255.0) green:(88/255.0) blue:(161/255.0) alpha:1];
        
        [cell addSubview:line];
        
        
       // cell.backgroundColor = [UIColor whiteColor];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==table_Listing)
    {
    return 10;
        
    }
    else
    {
        return menu_Data.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView!=table_Listing)
    {
    return tableView.frame.size.height/menu_Data.count;
        
    }
    
    return 310;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back_Tap:(UIButton *)sender {
//    
//    [self.navigationController popViewControllerAnimated:YES];

    leftMenu.hidden =NO;
    leftmeu_back.hidden =NO;
    
    [UIView animateWithDuration:.3f animations:^{
       
        leftmeu_back.alpha = .7f;
        
        leftMenu.frame = CGRectMake(0, 0, leftMenu.frame.size.width, self.view.frame.size.height);
        
    }];
    
}

- (IBAction)filter:(UIButton *)sender {
    
    
    FilterController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"filter"];
    
    [self.navigationController presentViewController:obj animated:YES completion:nil];
    
    
    
}

-(void)sideMemuoff
{
    [UIView animateWithDuration:.3f animations:^{
        
        leftmeu_back.alpha = 0;
        
        leftMenu.frame = CGRectMake(-leftMenu.frame.size.width, 0, leftMenu.frame.size.width, self.view.frame.size.height);
        
    }completion:^(BOOL finished) {
        
        leftMenu.hidden =YES;
        leftmeu_back.hidden =YES;
    }];
}

@end
