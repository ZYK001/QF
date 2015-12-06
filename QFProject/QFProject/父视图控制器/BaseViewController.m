//
//  BaseViewController.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/1.
//  Copyright © 2015年 赵英奎. All rights reserved.
//

//导入点击行跳转的页面
#import "AppDelegate.h"
#import "BaseViewController.h"
#import "DDMenuController.h"
#import "MainViewController.h"
#import "AVCaptureDeviceController.h"
#import "QREncodeViewController.h"
#import "NewsViewController.h"
#import "PlayerViewController.h"

@interface BaseViewController ()
{
    //声明视频播放器
    PlayerViewController *playerController;
    //声明新闻趣事
    NewsViewController * newsController;
    //声明二维码生成
    QREncodeViewController *qrController;
    //声明二维码扫描
    AVCaptureDeviceController *captureController;
}
@end

@implementation BaseViewController
//通过MVC设计模式，在视图控制器中将每个视图控制器与View绑定到一起
-(void)bindViewOnCurrentController:(UIViewController *)vc withBindView:(UIView *)view
{
    //并定View到ViewController
    self.view=view;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置每个视图控制器的背景颜色
    self.view.backgroundColor=[UIColor whiteColor];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma -mark 处理表格数据业务逻辑
//当点击表格时调用，跳转到对应的视图控制器，在首页面显示
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //通过单例调用App应用程序，获得代理
    AppDelegate *delegate=[self delegateInApplication];
    //调用侧滑页面
    DDMenuController *menuController=delegate.menuController;
    //调用侧滑页面中的主页面
    MainViewController *mainController=delegate.mainController;
    //清空主页面中所有子视图
    [self removeAllSubviewFromMainControllerView];
    switch (indexPath.row) {
            //自定义视频播放器
        case 0:
        {
            playerController=[[PlayerViewController alloc]init];
            [mainController.view addSubview:playerController.view];
            __block DDMenuController *menuVC=menuController;
            [menuController setRootController:mainController animated:YES animationFinished:^(NSString *Ok) {
                menuVC.title=@"KK直播";
            }];

            break;
            
        }
            //二维码扫描
        case 1:
        {
            captureController=[[AVCaptureDeviceController alloc]init];
            [mainController.view addSubview:captureController.view];
            __block DDMenuController *menuVC=menuController;
            [menuController setRootController:mainController animated:YES animationFinished:^(NSString *Ok) {
                menuVC.title=@"扫一扫";
            }];

            break;
        }
            //二维码生成
        case 2:
        {
            qrController=[[QREncodeViewController alloc]init];
            [mainController.view addSubview:qrController.view];
            __block DDMenuController *menuVC=menuController;
            [menuController setRootController:mainController animated:YES animationFinished:^(NSString *Ok) {
                menuVC.title=@"二维码";
            }];

            break;
            
        }
            //新闻趣事
        case 3:
        {
            newsController= [[NewsViewController alloc]init];
            [mainController.view addSubview:newsController.view];
            //当点击表格每行时返回首页面
            __block DDMenuController *menuVC=menuController;
            [menuController setRootController:mainController animated:YES animationFinished:^(NSString *Ok) {
                menuVC.title=@"新闻趣事";
            }];
            break;
        }
        default:
        {
            playerController=[[PlayerViewController alloc]init];
            [mainController.view addSubview:playerController.view];
            __block DDMenuController *menuVC=menuController;
            [menuController setRootController:mainController animated:YES animationFinished:^(NSString *Ok) {
                menuVC.title=@"KK直播";
            }];

            break;
        }
    }
}

//删除主视图中所有的子视图
-(void)removeAllSubviewFromMainControllerView
{
    //调用应用程序中的代理
    AppDelegate *delegate=[self delegateInApplication];
    //调用代理中的主页视图控制器
    MainViewController *mainController=delegate.mainController;
    //通过枚举便利删除主视图控制器中的所有子视图
    UIView *mainView=mainController.view;
    for (UIView *view in [mainView subviews]) {
        //删除视图
        [view removeFromSuperview];
    }
    
}

//获得应用程序中的代理方
-(AppDelegate *)delegateInApplication
{
    //通过单例调用App
    UIApplication *app=[UIApplication sharedApplication];
    //通过属性调用App中的代理方
    AppDelegate *delegate=app.delegate;
    return delegate;
}

//向当前视图控制器中添加子视图
-(void)addSubViewOnCurrentController:(UIView *)view
{
    [self.view addSubview:view];
}


@end
