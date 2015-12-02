//
//  AVCaptureDeviceController.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/2.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "AVCaptureDeviceController.h"
#import <AVFoundation/AVFoundation.h>
#import "AVCapture.h"
#import "ScanBoxView.h"
@interface AVCaptureDeviceController ()<AVCaptureMetadataOutputObjectsDelegate>
{
    ScanBoxView *_scanView;
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
    [self.view addSubview:_scanView];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_avCapture stopAVCapture];
   
}

//
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
