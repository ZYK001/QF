//
//  NObj.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/6.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface NObj : JSONModel
@property(strong,nonatomic)NSString* abstract;
@property(strong,nonatomic)NSString *image_url;
@property(strong,nonatomic)NSString *title;
@property(strong,nonatomic)NSString *url;


@end
