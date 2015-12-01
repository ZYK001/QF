//
//  LeftViewController.h
//  QFProject
//
//  Created by 赵英奎 on 15/11/30.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftView.h"
#import "BaseViewController.h"

@interface LeftViewController : BaseViewController
//声明在该视图控制器中将要显示的视图
@property(strong,nonatomic)LeftView *leftView;
@end
