//
//  ResumeViewController.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/20.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResumeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIProgressView *pv;
- (IBAction)downLoadBtn:(id)sender;

- (IBAction)stopDownLoad:(id)sender;
@end
