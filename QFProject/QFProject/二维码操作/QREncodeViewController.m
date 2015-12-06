//
//  QREncodeViewController.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/2.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "QREncodeViewController.h"
#import "QREncodeView.h"
@interface QREncodeViewController ()

@end

@implementation QREncodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor colorWithRed:40/255.0 green:42/255.0 blue:45/255.0 alpha:0.5];
    //背景图
    UIImageView *backView=[[UIImageView alloc]initWithFrame:CGRectMake(50, 85, SWEIDTH-100, SWEIDTH-100)];
    backView.image=[UIImage imageNamed:@"scan.png"];
    [self.view addSubview:backView];
    
    //生成二维码
    QREncodeView *qr=[[QREncodeView alloc]initWithFrame:CGRectMake(20, 20, backView.frame.size.width-40, backView.frame.size.width-40)];
    //将生成的二维码添加到视图
    [backView addSubview:qr];
    [qr createQREncodeImageView:backView andStringContent:@"KK直播"];
    
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
