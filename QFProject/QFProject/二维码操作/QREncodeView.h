//
//  QREncodeView.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/2.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
@interface QREncodeView : BaseView

-(void)createQREncodeImageView:(UIView *)supperView andStringContent:(NSString *)content;

@end
