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
#import "QREncodeViewController.h"
#import "NewsViewController.h"
#import "PlayerViewController.h"
#import "ResumeViewController.h"
#import "AVCaptureDeviceController.h"
#import "SDImageCache.h"

@interface BaseViewController ()<UIAlertViewDelegate>
{
    //声明视频播放器
    PlayerViewController *playerController;
    //声明新闻趣事
    NewsViewController * newsController;
    //声明二维码生成
    QREncodeViewController *qrController;
    //声明二维码扫描
    AVCaptureDeviceController *captureController;
    //声明断点续传页面
    ResumeViewController *resumeController;
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
            playerController=[PlayerViewController sharePlayerController];
            [mainController.view addSubview:playerController.view];
            __block DDMenuController *menuVC=menuController;
            [menuController setRootController:mainController animated:YES animationFinished:^(NSString *Ok) {
                menuVC.title=NSLocalizedString(@"工程名称", nil);
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
                menuVC.title=NSLocalizedString(@"扫一扫", nil);
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
                menuVC.title=NSLocalizedString(@"二维码", nil);
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
                menuVC.title=NSLocalizedString(@"新闻趣事",nil);
            }];
            break;
        }
            
        case 4:
        {
            //获得系统中现有的缓存文件
            NSUInteger intg = [[SDImageCache sharedImageCache] getSize];
            //计算缓存大小
            NSString * currentVolum = [NSString stringWithFormat:@"%@",[self fileSizeWithInterge:intg]];
            //提示框提示清楚的大小
            NSString *contString=[NSString stringWithFormat:@"已经帮您清除系统中缓%@存文件",currentVolum];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"清除缓存" message:contString delegate:self cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
            [alert show];
            //清除
            [[SDImageCache sharedImageCache] clearDisk];
            //返回到播放视频控制器
            playerController=[PlayerViewController sharePlayerController];
            [mainController.view addSubview:playerController.view];
            __block DDMenuController *menuVC=menuController;
            [menuController setRootController:mainController animated:YES animationFinished:^(NSString *Ok) {
                menuVC.title=NSLocalizedString(@"工程名称", nil);
            }];

            break;
        }
        case 5:
        {
            
            resumeController= [[ResumeViewController alloc]init];
            [mainController.view addSubview:resumeController.view];
            //当点击表格每行时返回首页面
            __block DDMenuController *menuVC=menuController;
            [menuController setRootController:resumeController animated:YES animationFinished:^(NSString *Ok) {
                menuVC.title=NSLocalizedString(@"文件下载",nil);
            }];

            
            break;
        }
            
        default:
        {
            newsController= [[NewsViewController alloc]init];
            [mainController.view addSubview:newsController.view];
            //当点击表格每行时返回首页面
            __block DDMenuController *menuVC=menuController;
            [menuController setRootController:mainController animated:YES animationFinished:^(NSString *Ok) {
                menuVC.title=NSLocalizedString(@"新闻趣事",nil);
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

//向当前页面添加背景图
-(void)addBackGroundViewOnControllerView
{
    CGRect rect=self.view.frame;
    rect.origin.y=300;
    rect.size.height=SHEIGHT-364;
    //添加背景图
    UIImageView *backGroundView=[[UIImageView alloc]initWithFrame:rect];
    backGroundView.image=[UIImage imageNamed:@"mkf"];
    [self.view addSubview:backGroundView];
}



//计算出缓存大小
- (NSString *)fileSizeWithInterge:(NSInteger)size{
    // 1k = 1024, 1m = 1024k
    if (size < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)size];
    }else if (size < 1024 * 1024){// 小于1m
        CGFloat aFloat = size/1024;
        return [NSString stringWithFormat:@"%.0fK",aFloat];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024 * 1024);
        return [NSString stringWithFormat:@"%.1fM",aFloat];
    }else{
        CGFloat aFloat = size/(1024*1024*1024);
        return [NSString stringWithFormat:@"%.1fG",aFloat];
    }
}


@end
