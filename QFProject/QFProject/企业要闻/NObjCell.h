//
//  NObjCell.h
//  QFProject
//
//  Created by 赵英奎 on 15/12/6.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NObjCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *abstract;
@property(strong,nonatomic)NSString *url;
@end
