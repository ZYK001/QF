//
//  DetailViewController.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/6.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "DetailViewController.h"
#import "MBProgressHUD.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //加载显示器
    [MBProgressHUD showHUDAddedTo:self.view  animated:YES];
    //显示网页
    NSURL *URL=[NSURL URLWithString:self.url];
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:URL];
    [self.webView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//当网页加载结束时，调用该方法
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
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
