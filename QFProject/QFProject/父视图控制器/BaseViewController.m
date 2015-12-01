//
//  BaseViewController.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/1.
//  Copyright © 2015年 赵英奎. All rights reserved.
//


#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
//通过MVC设计模式，在视图控制器中将每个视图控制器与View绑定到一起
-(void)bindViewOnCurrentController:(UIViewController *)vc andBindView:(UIView *)view
{
    //并定View到ViewController
    self.view=view;
}

//通过MVC设计模式，给每个View中需要显示的的数据设置数据元
-(void)reciveDataSourceInOrderViewDisplay:(NSArray *)array andView:(BaseView *)view
{
    //给View中的数据元数组赋值
    view.dataSourceArray=array;
    [view.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置每个视图控制器的背景颜色
    self.view.backgroundColor=[UIColor whiteColor];
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
