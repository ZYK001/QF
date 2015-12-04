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
    //生成二维码
    QREncodeView *qr=[[QREncodeView alloc]initWithFrame:CGRectMake(SWEIDTH/2-100, SHEIGHT/2-100, 200, 200)];
    //将生成的二维码添加到视图
    [self.view addSubview:qr];
    [qr createQREncodeImageView:self.view andStringContent:@"KK直播"];
    
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
