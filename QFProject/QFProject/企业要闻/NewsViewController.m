//
//  NewsViewController.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/3.
//  Copyright © 2015年 赵英奎. All rights reserved.
//
#import "NewsView.h"
#import "NewsViewController.h"


@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    //声明新闻视图控制器
    NewsView *newsView;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view

    //创建网络加载的数据
    self.dataSourceArray=@[@"首页面",@"扫一扫",@"二维码",@"清除缓存"];
    //创建新闻视图控制器中需要加载的视图
    newsView=[[NewsView alloc]initWithFrame:CGRectMake(0, 32, SWEIDTH, SHEIGHT-64) tableViewDelegate:self];
    //讲视图绑定到本视图控制器
    [self bindViewOnCurrentController:self withBindView:newsView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma -mark UITableViewDataSource
//设置表格需要显示的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //返回数组个数
    return [self dataSourceArray].count;
}

//创建表格中的每个Cell对象
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strIdentifier=@"cellId";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:strIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strIdentifier];
    }
    cell.textLabel.text=[[self dataSourceArray]objectAtIndex:indexPath.row];
    return cell;
    
}

@end
