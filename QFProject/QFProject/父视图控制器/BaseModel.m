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
    NSString *httpUrl = @"http://apis.baidu.com/txapi/keji/keji";
    NSString *httpArg = @"num=10&page=1";
    NSString *URL = [self request:httpUrl withHttpArg:httpArg];
//    AFHTTPRequestOperationManager *op=[AFHTTPRequestOperationManager manager];
//    op.securityPolicy.allowInvalidCertificates = YES;
}


-(NSString *)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg  {
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    return  urlStr;
}
@end
