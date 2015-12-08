//
//  ViewController.h
//  abc
//
//  Created by 赵英奎 on 15/12/7.
//  Copyright (c) 2015年 赵英奎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iflyMSC/IFlySpeechRecognizerDelegate.h>
#import <iflyMSC/IFlySpeechRecognizer.h>


@interface ViewController : UIViewController<IFlySpeechRecognizerDelegate>
{
    //不带界面的识别对象
    IFlySpeechRecognizer *_iFlySpeechRecognizer;
}
- (IBAction)btn2:(id)sender;

- (IBAction)btn:(id)sender;

@end

