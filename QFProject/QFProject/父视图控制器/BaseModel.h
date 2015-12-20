//
//  BaseModel.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/1.
//  Copyright © 2015年 赵英奎. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AFNetworking/AFHTTPSessionManager.h"
#import <Foundation/Foundation.h>

//声明加载网络数据成功时调用的Block
typedef void(^DataSuccessfull)(id obj);
//声明加载网络数据失败时调用的Block
typedef void(^DataFailed)(NSString *reason);

//声明断点续传下载进度
typedef void (^ResumeDownLoad)(float progress);

@interface BaseModel : NSObject<NSURLSessionDownloadDelegate, NSURLSessionDataDelegate>

@property(copy,nonatomic)ResumeDownLoad rD;

//二次封装AFN
-(void)GET:(NSString *)stringURL successfull:(DataSuccessfull ) dataSuccessfull failed:(DataFailed )dataFailed;

//封装断点续传
@property (nonatomic, strong) NSURLSessionDownloadTask *task;
@property (nonatomic, strong) NSData *resumeData;
@property (nonatomic, strong) NSURLSession *session;
@property (weak, nonatomic) UIProgressView *progressView;
//断点续传方法
-(void)resumeDownLoadWithURL:(NSString *)url downLoadProgress:(ResumeDownLoad) progress;
- (void)resume;
- (void)pause;

@end
