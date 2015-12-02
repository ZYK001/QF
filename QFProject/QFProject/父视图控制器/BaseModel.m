//
//  BaseModel.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/1.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

#import "BaseModel.h"
#import "AppDelegate.h"
#import "DDMenuController.h"
#import "MainViewController.h"
#import "AVCaptureDeviceController.h"

@implementation BaseModel

#pragma -mark 处理表格数据业务逻辑
//设置表格需要显示的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self dataSourceArray].count;
}

//创建表格中的每个Cell对象
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strIdentifier=@"cellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:strIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strIdentifier];
    }
    cell.textLabel.text=[[self dataSourceArray]objectAtIndex:indexPath.row];
    return cell;
    
}

//当点击表格时调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIApplication *app=[UIApplication sharedApplication];
    AppDelegate *delegate=app.delegate;
    DDMenuController *menuController=delegate.menuController;

    switch (indexPath.row) {
            //二维码
        case 1:
        {
            AVCaptureDeviceController *captureController=[[AVCaptureDeviceController alloc]init];
            [menuController setRootController:captureController animated:YES];
            break;
        }
            
        default:
        {
            //当点击表格每行时返回首页面
            [menuController setRootController:delegate.mainController animated:YES];
            break;
        }
    }
  }



@end
