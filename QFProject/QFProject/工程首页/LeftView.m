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
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        CGRect frame=self.frame;
        frame.origin.y=64;
        self.tableView.frame=frame;
    }
    return self;
}

@end
