
//
//  BaseView.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/1.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

//当加载该视图时首先将表格视图添加到当前View
-(id)initWithFrame:(CGRect)frame tableViewDelegate:(id)obj
{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.tableView=[[UITableView alloc]initWithFrame:frame];
        self.tableView.delegate=obj;
        self.tableView.dataSource=obj;
        [self addSubview:self.tableView];
        [self.tableView reloadData];
    }
    return self;
}

//通过Masonry设置当前视图的适配
-(void)setAutoLayOutOnTheViewWithMasonry
{
    
}

@end
