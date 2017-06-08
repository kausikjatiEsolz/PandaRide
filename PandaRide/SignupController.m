//
//  SignupController.m
//  Panda Riders
//
//  Created by Rahul Singha Roy on 10/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "SignupController.h"

@interface SignupController ()<UITextFieldDelegate>
{
    float keybord_height;
}

@end

@implementation SignupController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, last_lbl.frame.origin.y+last_lbl.frame.size.height+20);
    
    for (UITextField *text in _scrollView.subviews)
    {
        if ([text isKindOfClass:[UITextField class]])
        {
            text.delegate = self;
        }
    }
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)TarminateWhiteSpace:(NSString *)Str
{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [Str stringByTrimmingCharactersInSet:whitespace];
    return trimmed;
}

-(BOOL)Emailtest:(NSString *)Email
{
    
    NSString *emailRegex = @"^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,4})$";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    NSRange aRange;
    
    if([emailTest evaluateWithObject:Email]) {
        
        aRange = [Email rangeOfString:@"." options:NSBackwardsSearch range:NSMakeRange(0, [Email length])];
        
        NSInteger indexOfDot = aRange.location;
        
        //NSLog(@"aRange.location:%d - %d",aRange.location, indexOfDot);
        
        if(aRange.location != NSNotFound) {
            
            NSString *topLevelDomain = [Email substringFromIndex:indexOfDot];
            
            topLevelDomain = [topLevelDomain lowercaseString];
            
            //NSLog(@"topleveldomains:%@",topLevelDomain);
            
            NSSet *TLD;
            
            TLD = [NSSet setWithObjects:@".aero", @".asia", @".biz", @".cat", @".com", @".coop", @".edu", @".gov", @".info", @".int", @".jobs", @".mil", @".mobi", @".museum", @".name", @".net", @".org", @".pro", @".tel", @".travel", @".ac", @".ad", @".ae", @".af", @".ag", @".ai", @".al", @".am", @".an", @".ao", @".aq", @".ar", @".as", @".at", @".au", @".aw", @".ax", @".az", @".ba", @".bb", @".bd", @".be", @".bf", @".bg", @".bh", @".bi", @".bj", @".bm", @".bn", @".bo", @".br", @".bs", @".bt", @".bv", @".bw", @".by", @".bz", @".ca", @".cc", @".cd", @".cf", @".cg", @".ch", @".ci", @".ck", @".cl", @".cm", @".cn", @".co", @".cr", @".cu", @".cv", @".cx", @".cy", @".cz", @".de", @".dj", @".dk", @".dm", @".do", @".dz", @".ec", @".ee", @".eg", @".er", @".es", @".et", @".eu", @".fi", @".fj", @".fk", @".fm", @".fo", @".fr", @".ga", @".gb", @".gd", @".ge", @".gf", @".gg", @".gh", @".gi", @".gl", @".gm", @".gn", @".gp", @".gq", @".gr", @".gs", @".gt", @".gu", @".gw", @".gy", @".hk", @".hm", @".hn", @".hr", @".ht", @".hu", @".id", @".ie", @" No", @".il", @".im", @".in", @".io", @".iq", @".ir", @".is", @".it", @".je", @".jm", @".jo", @".jp", @".ke", @".kg", @".kh", @".ki", @".km", @".kn", @".kp", @".kr", @".kw", @".ky", @".kz", @".la", @".lb", @".lc", @".li", @".lk", @".lr", @".ls", @".lt", @".lu", @".lv", @".ly", @".ma", @".mc", @".md", @".me", @".mg", @".mh", @".mk", @".ml", @".mm", @".mn", @".mo", @".mp", @".mq", @".mr", @".ms", @".mt", @".mu", @".mv", @".mw", @".mx", @".my", @".mz", @".na", @".nc", @".ne", @".nf", @".ng", @".ni", @".nl", @".no", @".np", @".nr", @".nu", @".nz", @".om", @".pa", @".pe", @".pf", @".pg", @".ph", @".pk", @".pl", @".pm", @".pn", @".pr", @".ps", @".pt", @".pw", @".py", @".qa", @".re", @".ro", @".rs", @".ru", @".rw", @".sa", @".sb", @".sc", @".sd", @".se", @".sg", @".sh", @".si", @".sj", @".sk", @".sl", @".sm", @".sn", @".so", @".sr", @".st", @".su", @".sv", @".sy", @".sz", @".tc", @".td", @".tf", @".tg", @".th", @".tj", @".tk", @".tl", @".tm", @".tn", @".to", @".tp", @".tr", @".tt", @".tv", @".tw", @".tz", @".ua", @".ug", @".uk", @".us", @".uy", @".uz", @".va", @".vc", @".ve", @".vg", @".vi", @".vn", @".vu", @".wf", @".ws", @".ye", @".yt", @".za", @".zm", @".zw", nil];
            
            if(topLevelDomain != nil && ([TLD containsObject:topLevelDomain])) {
                
                //NSLog(@"TLD contains topLevelDomain:%@",topLevelDomain);
                
                return false;
                
            }
            
            /*else {
             
             NSLog(@"TLD DOEST NOT contains topLevelDomain:%@",topLevelDomain);
             
             }*/
            
        }
    }
    return true;
}


- (void)keyboardWillShow:(NSNotification *)n
{
    if (keybord_height==0)
    {
        //  NSDictionary* userInfo = [n userInfo];
        
        // get the size of the keyboard
        CGSize keyboardSize = [[[n userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        
        //Given size may not account for screen rotation
        keybord_height= MIN(keyboardSize.height,keyboardSize.width);
        
        
        
       _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, last_lbl.frame.origin.y+last_lbl.frame.size.height+20+keybord_height);
        
        
        
    }
    
    
    // scroll.contentSize = CGSizeMake(0, scroll.contentSize.height);
    
    
    
}
- (void)keyboardWillHide:(NSNotification *)n
{
    
    
    //    scroll.contentSize =CGSizeMake(scroll_size, 0);
    //    [scroll setContentOffset:CGPointMake(scroll.contentOffset.x, 0) animated:YES];
    
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, last_lbl.frame.origin.y+last_lbl.frame.size.height+20);
    
    keybord_height=0;
    
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    [_scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y-textField.frame.size.height*3) animated:YES];
    
    return  YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backTosignin:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated: YES];
    
}
@end
