//
//  AppDelegate.h
//  QFProject
//
//  Created by 赵英奎 on 15/11/26.
//  Copyright (c) 2015年 赵英奎. All rights reserved.
//
//  b98b13a3f2ffcaf2fbe84f9f


#import <UIKit/UIKit.h>
#import "DDMenuController.h"
#import "MainViewController.h"
#import "LeftViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(strong,nonatomic)UINavigationController *rootNavigationController;
@property(strong,nonatomic)DDMenuController *menuController;
@property(strong,nonatomic)LeftViewController *leftController;
@property(strong,nonatomic)MainViewController *mainController;

@end

