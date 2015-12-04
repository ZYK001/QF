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
    // Do any additional setup after loading the view.
    PlayerView * playerView=[[PlayerView alloc]initWithFrame:CGRectMake(0, 64, SWEIDTH, 300)];
    playerView.backgroundColor=[UIColor blackColor];
    [self addSubViewOnCurrentController:playerView];
    
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
