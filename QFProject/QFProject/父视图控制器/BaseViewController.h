//
//  BaseViewController.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/1.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
@interface BaseViewController : UIViewController
//通过MVC设计模式，在视图控制器中将每个视图控制器与View绑定到一起
-(void)bindViewOnCurrentController:(UIViewController *)vc andBindView:(UIView *)view;
//通过MVC设计模式，给每个View中需要显示的的数据设置数据元
-(void)reciveDataSourceInOrderViewDisplay:(NSArray *)array andView:(BaseView *)view;
@end
