//
//  PlayerViewController.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/4.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "PlayerViewController.h"
#import "PlayerView.h"
#import <MediaPlayer/MediaPlayer.h>
@interface PlayerViewController ()
{
    //声明视频播放器
    MPMoviePlayerViewController *_movieController;
    //声明加载控件
    UIActivityIndicatorView *_act;
    //视频播放器背景图
    PlayerView * _playerView;
}
@end

@implementation PlayerViewController

+(PlayerViewController *)sharePlayerController
{
    static PlayerViewController *playerController=nil;
    if (playerController==nil) {
        playerController=[[PlayerViewController alloc]init];
        
    }
    return playerController;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackGroundViewOnControllerView];
    // Do any additional setup after loading the view.
    _playerView=[[PlayerView alloc]initWithFrame:CGRectMake(0, 0, SWEIDTH, 300)];
    _playerView.backgroundColor=[UIColor blackColor];
    [self addSubViewOnCurrentController:_playerView];
    //添加与主播互动按钮
    [self addChatBtns];
    [self movieControllerNotification];

    
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
//监听视频是否播放结束
-(void)movieControllerNotification
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playerButtonClickActionNotification) name:@"playerButtonClickAction" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(endMovie) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(startPlay) name:MPMoviePlayerReadyForDisplayDidChangeNotification object:nil];
}
//当正式开始播放视频时，调用该方法
-(void)startPlay
{
    //停止loading
    [_act stopAnimating];
}
//当播放结束时，移除播放视图
-(void)endMovie
{
    [_movieController.moviePlayer.view removeFromSuperview];
}


-(void)playerButtonClickActionNotification
{
    //NSURL *url=[NSURL URLWithString:@"http://video.izhangchu.com:280/zhangchu/promotion/Springconcessions.mp4"];
    NSURL *url=[NSURL URLWithString:@"http://127.0.0.1:1234"];
    
    //创始视频播放器对象
    _movieController=[[MPMoviePlayerViewController alloc]initWithContentURL:url];
    //设置播放器样式
    _movieController.moviePlayer.controlStyle=MPMovieControlStyleEmbedded;
    //设置视频视频播放器的坐标和大小
    _movieController.moviePlayer.view.frame=_playerView.frame;
    //设置数据源
    _movieController.moviePlayer.movieSourceType=MPMovieSourceTypeFile;
    //将视频播放器的视图，添加到self.view
    [self.view addSubview:_movieController.moviePlayer.view];
    //播放视频
    [_movieController.moviePlayer prepareToPlay];
    [_movieController.moviePlayer play];
    
    
    //Loading...
    _act=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _act.frame=CGRectMake(SWEIDTH/2-20, 120, 30, 30);
    [self.view addSubview:_act];
    [_act startAnimating];

    
}

@end
