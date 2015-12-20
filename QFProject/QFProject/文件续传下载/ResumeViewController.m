//
//  ResumeViewController.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/20.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "ResumeViewController.h"
#import "KKResume.h"
@interface ResumeViewController ()
{
    KKResume *resume;
}
@end

@implementation ResumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    resume=[[KKResume alloc]init];
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

- (IBAction)downLoadBtn:(id)sender {
    
    
    [resume resumeDownLoadWithURL:@"http://video.izhangchu.com:280/zhangchu/promotion/Springconcessions.mp4" downLoadProgress:^(float progress) {
        //NSLog(@"%f",progress);
        self.pv.progress=progress;
        
    }];

}

- (IBAction)stopDownLoad:(id)sender {
    [resume pause];
}
@end
