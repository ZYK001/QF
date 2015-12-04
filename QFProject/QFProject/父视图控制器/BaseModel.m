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
    NSURL *URL = [NSURL URLWithString:@"http://apis.baidu.com/showapi_open_bus/channel_news/search_news"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
   
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
    
}
@end
