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
    UILabel *lbContent=[[UILabel alloc]initWithFrame:CGRectMake(-40, -40, 350, 20)];
    lbContent.textColor=[UIColor blueColor];
    lbContent.text=@"下载KK直播，别忘记推荐给你的朋友并哦～";
    [self addSubview:lbContent];
    lbContent.font=[UIFont systemFontOfSize:15];
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    imgView.image=[QRCodeGenerator qrImageForString:content imageSize:200];
    self.backgroundColor=[UIColor whiteColor];
    [self addSubview:imgView];
}



@end
