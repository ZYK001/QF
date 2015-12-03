//
//  AVCaptureDeviceController.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/2.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "AVCapture.h"
#import "ScanBoxView.h"
#import "AVCaptureDeviceController.h"
#import <AVFoundation/AVFoundation.h>

@interface AVCaptureDeviceController ()<AVCaptureMetadataOutputObjectsDelegate>
{
    //声明扫面框
    ScanBoxView *_scanView;
    //声明扫描器
    AVCapture *_avCapture;
}
@end

@implementation AVCaptureDeviceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建模型
    _avCapture=[[AVCapture alloc]init];
    AVCaptureVideoPreviewLayer * layer =[_avCapture startAVCaptureWithDelegate:self andBkView:self.view];
    //创建视图
    _scanView=[[ScanBoxView alloc]initWithFrame:self.view.bounds];
    _scanView.backgroundColor=[UIColor clearColor];
    //在二维码扫面图层上添加视图
    [_scanView addScanBoxandScanlineLayer:layer];
    //讲扫描框添加到视图
    [self.view addSubview:_scanView];
    
}

//退出该视图时，关闭二维码扫描
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //关闭扫描
    [_avCapture stopAVCapture];
   
}
//进入该视图时，打开二维码扫描
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //打开扫描
    [_avCapture startAVCapture];
}

//当扫描到结果时调用该方法
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        //[session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        //输出扫描字符串
        NSLog(@"%@",metadataObject.stringValue);
        [_avCapture stopAVCapture];
        [_scanView removeScanLayerFromSupperView];
        //跳转到扫描结果页面
        NSURL *toUrl=[NSURL URLWithString:metadataObject.stringValue];
        [[UIApplication sharedApplication]openURL:toUrl];
    }
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
