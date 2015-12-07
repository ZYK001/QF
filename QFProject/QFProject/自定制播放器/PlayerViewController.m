//
//  PlayerViewController.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/4.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "PlayerViewController.h"
#import "PlayerView.h"
@interface PlayerViewController ()

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackGroundViewOnControllerView];
    // Do any additional setup after loading the view.
    PlayerView * playerView=[[PlayerView alloc]initWithFrame:CGRectMake(0, 0, SWEIDTH, 300)];
    playerView.backgroundColor=[UIColor blackColor];
    [self addSubViewOnCurrentController:playerView];
    //添加与主播互动按钮
    [self addChatBtns];
   
    
}

//添加与主播互动按钮
-(void)addChatBtns
{
    //添加与主播互动按钮
    UIButton *chatBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    [chatBtn setBackgroundImage:[UIImage imageNamed:@"sh.png"] forState:UIControlStateNormal];
    //各个屏幕适配计算
    chatBtn.frame=CGRectMake(SWEIDTH/2-((SHEIGHT-364)/4), 300, (SHEIGHT-364)/2, (SHEIGHT-364)/2);
    [self.view addSubview:chatBtn];
    //给按钮添加点击事件
    [chatBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加按钮下的描述文字
    UILabel *lbDescription=[[UILabel alloc]initWithFrame:CGRectMake(SWEIDTH/2-((SHEIGHT-364)/4), 300+(SHEIGHT-364)/2+20, (SHEIGHT-364)/2,100)];
    lbDescription.text=NSLocalizedString(@"按钮描述", nil);
    lbDescription.textColor=[UIColor redColor];
    lbDescription.numberOfLines=0;
    lbDescription.lineBreakMode=NSLineBreakByCharWrapping;
    lbDescription.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:lbDescription];
    
}
-(void)btnClick:(UIButton *)bt
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
