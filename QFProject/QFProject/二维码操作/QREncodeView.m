//
//  QREncodeView.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/2.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "QREncodeView.h"
#import "QRCodeGenerator.h"
@implementation QREncodeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)createQREncodeImageView:(UIView *)supperView andStringContent:(NSString *)content;
{
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(supperView.bounds.size.width/4, supperView.bounds.size.width/4, supperView.frame.size.width/2, supperView.frame.size.width/2)];
    imgView.image=[QRCodeGenerator qrImageForString:content imageSize:200];
    [supperView addSubview:imgView];
}



@end
