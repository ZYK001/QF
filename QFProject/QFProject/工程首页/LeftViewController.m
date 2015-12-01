//
//  LeftViewController.m
//  QFProject
//
//  Created by 赵英奎 on 15/11/30.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //设置左侧视图将要显示的数据元数据
    leftViewModel= [[LeftViewModel alloc]init];
    //设置模型中需要使用的数据
    leftViewModel.dataSourceArray=@[@"1",@"2"];
    //创建准备显示的左侧视图View
    leftViewInDDMenu=[[LeftView alloc]initWithFrame:self.view.frame tableViewDelegate:leftViewModel];
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
