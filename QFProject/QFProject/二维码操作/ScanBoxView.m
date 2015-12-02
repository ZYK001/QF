//
//  ScanBoxView.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/2.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "ScanBoxView.h"

@implementation ScanBoxView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)addScanBoxandScanlineLayer:(AVCaptureVideoPreviewLayer *) layer;
{
    //设置二维码的扫描边框
    _boxView= [[UIView alloc] initWithFrame:CGRectMake(layer.bounds.size.width * 0.2f, layer.bounds.size.height * 0.3f, layer.bounds.size.width - layer.bounds.size.width * 0.4f, layer.bounds.size.height - SHEIGHT * 0.6f)];
    _boxView.backgroundColor=[UIColor clearColor];
    _boxView.layer.borderColor=[[UIColor blackColor]CGColor];
    _boxView.layer.borderWidth=1;
    [self addSubview:_boxView];
    
    //扫描线
    _scanLayer = [[UIView alloc] init];
    _scanLayer.frame = CGRectMake(0, 0, _boxView.bounds.size.width, 2);
    _scanLayer.backgroundColor = [UIColor greenColor];
    [_boxView addSubview:_scanLayer];
    
    [self moveScanLayer];
    //开始捕获

    
}
-(void)removeScanLayerFromSupperView
{
    [_scanLayer removeFromSuperview];
}
- (void)moveScanLayer
{
    static int  flagScan=YES;
    [UIView animateWithDuration:1 animations:^{
        if (flagScan) {
            _scanLayer.frame=CGRectMake(0, _boxView.frame.size.height, _boxView.frame.size.width, 1);
            flagScan=0;
        }
        else
        {
            _scanLayer.frame=CGRectMake(0, 0, _boxView.frame.size.width, 1);
            
            flagScan=1;
        }
        
    } completion:^(BOOL finished) {
        [self moveScanLayer];
    }];
}
@end
