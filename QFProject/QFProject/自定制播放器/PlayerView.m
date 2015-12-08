//
//  PlayerView.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/4.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "PlayerView.h"
#import "PlayerViewController.h"
@implementation PlayerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        //self.image=[UIImage imageNamed:@"视频背景"];
        self.userInteractionEnabled=YES;
        //添加播放器中的logo文字
        UILabel *playerName=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
        playerName.text=NSLocalizedString(@"工程名称", nil);
        playerName.textColor=[UIColor orangeColor];
        playerName.backgroundColor=[UIColor clearColor];
        playerName.font=[UIFont systemFontOfSize:17];
        [self addSubview:playerName];
        
//        UIImageView *logoView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
//        logoView.image=[UIImage imageNamed:@"logo"];
//        [self addSubview:logoView];
        
        //添加播放器中的播放图片
        UIImageView *player=[[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width/2-25, self.bounds.size.height/2-25, 50, 50)];
        player.image=[UIImage imageNamed:@"首页-播放"];
        [self addSubview:player];
        //播放按钮添加点击手势
        UITapGestureRecognizer *playTapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playerButtonClickAction)];
        player.userInteractionEnabled=YES;
        [player addGestureRecognizer:playTapGesture];
        
    }
    return self;
}
-(void)playerButtonClickAction
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"playerButtonClickAction" object:nil];
}



@end
