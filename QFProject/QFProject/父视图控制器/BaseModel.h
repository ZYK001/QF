//
//  BaseModel.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/1.
//  Copyright © 2015年 赵英奎. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import <Foundation/Foundation.h>

//声明加载网络数据成功时调用的Block
typedef void(^DataSuccessfull)(id obj);
//声明加载网络数据失败时调用的Block
typedef void(^DataFailed)(NSString *reason);


@interface BaseModel : NSObject
//二次封装AFN
-(void)GET:(NSString *)stringURL successfull:(DataSuccessfull ) dataSuccessfull failed:(DataFailed )dataFailed;



@end
