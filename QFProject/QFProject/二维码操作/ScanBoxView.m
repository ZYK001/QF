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
    //通过动画移动扫描线
    [self moveScanLayer];
   

    
}
//当扫描结束时移除扫描线
-(void)removeScanLayerFromSupperView
{
    //移除
    [_scanLayer removeFromSuperview];
}
//在动画中定时移动扫描线
- (void)moveScanLayer
{
    //声明标签，控制扫描线的上下移动
    static int  flagScan=YES;
    [UIView animateWithDuration:1 animations:^{
        if (flagScan) {
            //将扫描线的位置挪动到边框低
            _scanLayer.frame=CGRectMake(0, _boxView.frame.size.height, _boxView.frame.size.width, 1);
            //设置当前位置标签
            flagScan=0;
        }
        else
        {
            //将扫描线的位置挪动刀边框头
            _scanLayer.frame=CGRectMake(0, 0, _boxView.frame.size.width, 1);
            //设置当前位置标签
            flagScan=1;
        }
        
    } completion:^(BOOL finished) {
        //递归调用
        [self moveScanLayer];
    }];
}
@end
