
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
        //创建当前视图中将要显示的表格对象
        self.tableView=[[UITableView alloc]initWithFrame:frame];
        self.tableView.delegate=obj;
        self.tableView.dataSource=obj;
        [self addSubview:self.tableView];
        [self.tableView reloadData];
    }
    return self;
}

//通过Masonry设置当前视图的适配
-(void)setAutoLayOutOnTheViewWithMasonry:(UIView*)view supperView:(UIView *)supperView leftMargin:(float)left topMargin:(float)top rightMargin:(float)right bottomMargin:(float)bottom
{
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //设置相对坐标
        make.edges.equalTo(supperView.mas_top).offset(top);
        make.edges.equalTo(supperView.mas_left).offset(left);
        make.edges.equalTo(supperView.mas_bottom).offset(bottom);
        make.edges.equalTo(supperView.mas_right).offset(right);
        
    }];
}

//隐藏表格中下方多余的lines
-(void)hideTableViewBotmlines
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectZero];
    [self.tableView setTableFooterView:view];
}

@end
