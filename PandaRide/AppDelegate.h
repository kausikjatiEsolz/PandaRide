//
//  AppDelegate.h
//  Panda Riders
//
//  Created by Rahul Singha Roy on 09/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

