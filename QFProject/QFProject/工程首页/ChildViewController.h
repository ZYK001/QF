//
//  LeftViewController.h
//  QFProject
//
//  Created by 赵英奎 on 15/11/30.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "ChildView.h"
#import <UIKit/UIKit.h>
#import "LeftViewModel.h"
#import "BaseViewController.h"

@interface ChildViewController : BaseViewController
{
    //主页面左侧视图
    ChildView *leftViewInDDMenu;
    //主页面左侧视图模型
    LeftViewModel *leftViewModel;
}
@end
