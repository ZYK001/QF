//
//  DetailViewController.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/6.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(strong,nonatomic)NSString *url;
@end
