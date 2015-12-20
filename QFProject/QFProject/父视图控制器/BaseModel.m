//
//  BaseModel.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/1.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

-(void)GET:(NSString *)stringURL successfull:(DataSuccessfull ) dataSuccessfull failed:(DataFailed )dataFailed
{
    NSString *httpUrl = @"http://apis.baidu.com/songshuxiansheng/news/news";
    NSString *httpArg = @"";
    NSString *URL = [self request:httpUrl withHttpArg:httpArg];
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"e26faa1564a7dfde6466a930baae40ee" forHTTPHeaderField:@"apiKey"];
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dict);
        dataSuccessfull(dict);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
        dataFailed(error.localizedDescription);
    }];
   
}


-(NSString *)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg  {
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    return  urlStr;
}
 -(void)resumeDownLoadWithURL:(NSString *)url downLoadProgress:(ResumeDownLoad) progress;
{
    self.rD=progress;
    
    if (self.task == nil) { // 开始（继续）下载
        if (self.resumeData) { // 恢复
            [self resume];
        } else { // 开始
            [self start:url];
        }
    } else { // 暂停
        [self pause];
    }
       
}

//懒加载
- (NSURLSession *)session
{
    if (!_session) {
        // 获得session
        NSURLSessionConfiguration *cfg = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:cfg delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

/**
 *  从零开始
 */
- (void)start:(NSString *)urlString
{
    // 1.创建一个下载任务
    NSURL *url = [NSURL URLWithString:urlString];
    self.task = [self.session downloadTaskWithURL:url];
    
    // 2.开始任务
    [self.task resume];
}

/**
 *  恢复（继续）
 */
- (void)resume
{
    // 传入上次暂停下载返回的数据，就可以恢复下载
    self.task = [self.session downloadTaskWithResumeData:self.resumeData];
    
    // 开始任务
    [self.task resume];
    
    // 清空
    self.resumeData = nil;
}

/**
 *  暂停
 */
- (void)pause
{
    __weak typeof(self) vc = self;
    [self.task cancelByProducingResumeData:^(NSData *resumeData) {
        //  resumeData : 包含了继续下载的开始位置\下载的url
        vc.resumeData = resumeData;
        vc.task = nil;
    }];
}

#pragma mark - NSURLSessionDownloadDelegate
//下载结束时，调用该方法
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    // response.suggestedFilename ： 建议使用的文件名，一般跟服务器端的文件名一致
    NSString *file = [caches stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    
    // 将临时文件剪切或者复制Caches文件夹
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // AtPath : 剪切前的文件路径
    // ToPath : 剪切后的文件路径
    [mgr moveItemAtPath:location.path toPath:file error:nil];
}


//获得下载进度
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    NSLog(@"获得下载进度--%@", [NSThread currentThread]);
    // 获得下载进度
    self.progressView.progress = (double)totalBytesWritten / totalBytesExpectedToWrite;
    NSLog(@"%f",(double)totalBytesWritten / totalBytesExpectedToWrite);
    self.rD((double)totalBytesWritten / totalBytesExpectedToWrite);
}

@end
