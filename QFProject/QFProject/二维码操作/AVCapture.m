//
//  AVCapture.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/2.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "AVCapture.h"

@implementation AVCapture
-(AVCaptureVideoPreviewLayer*)startAVCaptureWithDelegate:(id)obj andBkView:(UIView *)view;
{
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:obj queue:dispatch_get_main_queue()];
    
    //初始化链接对象
    session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [session setSessionPreset:AVCaptureSessionPresetHigh];
    //设置二维码的扫描区
    output.rectOfInterest=CGRectMake(0.2,0.2,0.8, 0.5);
    
    [session addInput:input];
    [session addOutput:output];
    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame=view.layer.bounds;
    [view.layer insertSublayer:layer atIndex:0];
    //开始捕获
    [session startRunning];
    
    
    return layer;
}

-(void)stopAVCapture;
{
    [session stopRunning];
}
-(void)startAVCapture
{
    [session startRunning];
}
@end
