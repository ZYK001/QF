//
//  AppDelegate.m
//  QFProject
//
//  Created by 赵英奎 on 15/11/26.
//  Copyright (c) 2015年 赵英奎. All rights reserved.
//

#import "AppDelegate.h"
#import "APService.h"
#import "BaseModel.h"
#import "PlayerViewController.h"
@interface AppDelegate ()
{
    PlayerViewController *playerController;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //注册推送
    [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                   UIRemoteNotificationTypeSound |
                                                   UIRemoteNotificationTypeAlert)
                                       categories:nil];
    [APService setupWithOption:launchOptions];
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    
    self.mainController=[[MainViewController alloc]init];
    playerController=[PlayerViewController sharePlayerController];
    [self.mainController.view addSubview:playerController.view];
    self.leftController=[[ChildViewController alloc]init];
    self.menuController=[[DDMenuController alloc]initWithRootViewController:self.mainController];
    self.menuController.leftViewController=self.leftController;
    self.rootNavigationController=[[UINavigationController alloc]initWithRootViewController:self.menuController];
    [self.rootNavigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航条"] forBarMetrics:UIBarMetricsDefault];
    self.menuController.title=NSLocalizedString(@"工程名称", @"工程名称");
    self.window.rootViewController=self.rootNavigationController;

    [self.window makeKeyAndVisible];
    
    return YES;
}

//接受从服务器中请求下来的device token,并且将device token传送给极光服务器
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    [APService registerDeviceToken:deviceToken];
}

//接收发送的消息
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
       NSLog(@"%@",userInfo);
    [APService handleRemoteNotification:userInfo];
 
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
