//
//  BaseView.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/1.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseView : UIView<UITableViewDelegate,UITableViewDataSource>
//设置将要显示的表格
@property(strong,nonatomic)UITableView *tableView;
//设置表格中加载数据的数据元数组
@property(strong,nonatomic)NSArray *dataSourceArray;
@end
