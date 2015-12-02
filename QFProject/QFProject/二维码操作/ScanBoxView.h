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
    UIView *_scanLayer;
    UIView * _boxView;
 
}
-(void)addScanBoxandScanlineLayer:(AVCaptureVideoPreviewLayer *) layer;
-(void)removeScanLayerFromSupperView;
@end
