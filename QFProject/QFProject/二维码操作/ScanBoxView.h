//
//  ScanBoxView.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/2.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ScanBoxView : UIView
{
    //扫描线
    UIView *_scanLayer;
    //扫描框
    UIView * _boxView;
 
}
//将扫描线及扫描框添加到视图
-(void)addScanBoxandScanlineLayer;
//扫描结束时移除扫描线
-(void)removeScanLayerFromSupperView;
@end
