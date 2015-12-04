//
//  PlayerView.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/4.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "PlayerView.h"

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
        UILabel *playerName=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
        playerName.text=@"KK直播";
        playerName.textColor=[UIColor orangeColor];
        playerName.backgroundColor=[UIColor clearColor];
        playerName.font=[UIFont systemFontOfSize:15];
        [self addSubview:playerName];
        
        UIImageView *player=[[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width/2-25, self.bounds.size.height/2-25, 50, 50)];
        player.image=[UIImage imageNamed:@"首页-播放"];
        [self addSubview:player];
        
    }
    return self;
}
@end
