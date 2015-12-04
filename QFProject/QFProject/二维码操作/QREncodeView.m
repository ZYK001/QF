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
    UILabel *lbContent=[[UILabel alloc]initWithFrame:CGRectMake(-10, -50, 300, 20)];
    lbContent.textColor=[UIColor orangeColor];
    lbContent.text=@"下载KK直播，别忘记点赞哦～";
    [self addSubview:lbContent];
    
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    imgView.image=[QRCodeGenerator qrImageForString:content imageSize:200];
    self.backgroundColor=[UIColor whiteColor];
    [self addSubview:imgView];
}



@end
