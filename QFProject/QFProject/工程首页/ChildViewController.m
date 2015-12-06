//
//  LeftViewController.m
//  QFProject
//
//  Created by 赵英奎 on 15/11/30.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //设置模型中需要使用的数据
    self.dataSourceArray=@[NSLocalizedString(@"工程名称", nil),NSLocalizedString(@"扫一扫", nil),NSLocalizedString(@"二维码", nil),NSLocalizedString(@"新闻趣事", nil),NSLocalizedString(@"清除缓存", nil),NSLocalizedString(@"视频下载", nil),NSLocalizedString(@"本地闹钟", nil),NSLocalizedString(@"分享", nil)];
    //创建准备显示的左侧视图View
    leftViewInDDMenu=[[ChildView alloc]initWithFrame:self.view.frame tableViewDelegate:self];
    //将左侧视图View绑定到侧滑的左侧视图控制器中
    [self bindViewOnCurrentController:self withBindView:leftViewInDDMenu];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//设置表格需要显示的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self dataSourceArray].count;
}

//创建表格中的每个Cell对象
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strIdentifier=@"cellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:strIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strIdentifier];
    }
    cell.textLabel.text=[[self dataSourceArray]objectAtIndex:indexPath.row];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
    
}

@end
