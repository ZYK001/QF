//
//  LeftView.m
//  QFProject
//
//  Created by 赵英奎 on 15/11/30.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "ChildView.h"

@implementation ChildView


//通过继承关系，重新写initWithFrame:(CGRect)frame，覆盖父类
//从新设置左侧滑动视图的表格高度位置
-(id)initWithFrame:(CGRect)frame tableViewDelegate:(id)obj
{
    self=[super initWithFrame:frame tableViewDelegate:obj];
    if (self) {
        CGRect frame=self.frame;
        frame.origin.y=64;
        self.tableView.frame=frame;
        //调用父类中隐藏多余tableview的行
        [self hideTableViewBotmlines];
    }
    return self;
}



@end
