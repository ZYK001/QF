//
//  BaseView.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/1.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "Masonry.h"
#import <UIKit/UIKit.h>

@interface BaseView : UIView

//设置将要显示的表格
@property(strong,nonatomic)UITableView *tableView;
//通过Masonry设置当前视图的适配
-(void)setAutoLayOutOnTheViewWithMasonry:(UIView*)view supperView:(UIView *)supperView leftMargin:(float)left topMargin:(float)top rightMargin:(float)right bottomMargin:(float)bottom;
//当加载该视图时首先将表格视图添加到当前View并设置表格代理
-(id)initWithFrame:(CGRect)frame tableViewDelegate:(id)obj;
//隐藏表格中下方多余的lines
-(void)hideTableViewBotmlines;

@end
