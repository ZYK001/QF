//
//  BaseViewController.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/1.
//  Copyright © 2015年 赵英奎. All rights reserved.
//


#import <UIKit/UIKit.h>
@class AppDelegate;

@interface BaseViewController : UIViewController
//设置表格中加载数据的数据元数组
@property(strong,nonatomic)NSArray *dataSourceArray;
//向视图控制器中添加子视图
-(void)addSubViewOnCurrentController:(UIView *)view;
//获得应用程序中的代理方
-(AppDelegate *)delegateInApplication;
//通过MVC设计模式，在视图控制器中将每个视图控制器与View绑定到一起
-(void)bindViewOnCurrentController:(UIViewController *)vc withBindView:(UIView *)view;
//向当前页面添加背景图
-(void)addBackGroundViewOnControllerView;
@end
