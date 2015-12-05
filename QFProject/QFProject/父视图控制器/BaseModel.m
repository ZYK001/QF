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
@end
