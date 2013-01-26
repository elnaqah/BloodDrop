//
//  bdAppDelegate.h
//  BloodDrop
//
//  Created by AhmedElnaqah on 1/26/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import <UIKit/UIKit.h>

@class bdViewController;
@class bdMenuViewController;

@interface bdAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) bdMenuViewController *viewController;
@property (strong,nonatomic) UINavigationController * navigationController;

@end
