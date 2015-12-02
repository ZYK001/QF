//
//  LeftView.m
//  QFProject
//
//  Created by 赵英奎 on 15/11/30.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "LeftView.h"

@implementation LeftView


//通过继承关系，重新写initWithFrame:(CGRect)frame，覆盖父类
//从新设置左侧滑动视图的表格高度位置
-(id)initWithFrame:(CGRect)frame tableViewDelegate:(id)obj
{
    self=[super initWithFrame:frame tableViewDelegate:obj];
    if (self) {
        CGRect frame=self.frame;
        //以手机的状态栏为标准，判断当前状态的视屏是横评还是竖屏
        UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
        //设置表格视图初始化时相对屏幕上边距高度
        if(orientation==UIInterfaceOrientationLandscapeLeft||orientation==UIInterfaceOrientationLandscapeRight)
            frame.origin.y=32;
        else
            frame.origin.y=64;
        self.tableView.frame=frame;
        //通过通知中心，监听屏幕横纵状态变化
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willAnimateRotationToInterfaceOrientation:) name:@"willAnimateRotationToInterfaceOrientation" object:nil];
        //调用父类中隐藏多余tableview的行
        [self hideTableViewBotmlines];
    }
    return self;
}
//当前视图即将发生横竖屏转动时调用该方法
-(void)willAnimateRotationToInterfaceOrientation:(NSNotification *)positionString
{
    //当屏幕切换横纵状态时，修改里边表格视图相对屏幕上边距位置
    CGRect frame=self.tableView.frame;
    if ([@"SCREENHORIZENTAL" isEqualToString:positionString.object]) {
        frame.origin.y=32;
        
    }
    else
    {
        frame.origin.y=64;
    }
    self.tableView.frame=frame;
}


@end
