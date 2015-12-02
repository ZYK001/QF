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
    
    
    //设置左侧视图将要显示的数据元数据
    leftViewModel= [[LeftViewModel alloc]init];
    //设置模型中需要使用的数据
    leftViewModel.dataSourceArray=@[@"首页面",@"扫一扫",@"二维码",@"清除缓存",@"断点续传",@"多表查询",@"本地推送",@"三方分享",@"连接服务",@"OAth2.0Share"];
    //创建准备显示的左侧视图View
    leftViewInDDMenu=[[ChildView alloc]initWithFrame:self.view.frame tableViewDelegate:leftViewModel];
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

@end
