//
//  AVCapture.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/2.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
@interface AVCapture : NSObject
{
    AVCaptureSession * session;
}
-(AVCaptureVideoPreviewLayer*)startAVCaptureWithDelegate:(id)obj andBkView:(UIView *)view;
-(void)stopAVCapture;
-(void)startAVCapture;
@end
