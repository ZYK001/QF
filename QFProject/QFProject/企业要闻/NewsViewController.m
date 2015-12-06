//
//  NewsViewController.m
//  QFProject
//
//  Created by 赵英奎 on 15/12/3.
//  Copyright © 2015年 赵英奎. All rights reserved.
//
#import "News.h"
#import "NObj.h"
#import "NObjCell.h"
#import "NewsView.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "DDMenuController.h"
#import "DetailViewController.h"
#import "NewsViewController.h"
#import "UIImageView+WebCache.h"


@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    //声明新闻视图控制器
    NewsView *newsView;
    //新闻详情页面
    DetailViewController *detailController;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view

    //创建新闻视图控制器中需要加载的视图
    newsView=[[NewsView alloc]initWithFrame:CGRectMake(0, 0, SWEIDTH, SHEIGHT-64) tableViewDelegate:self];
    //隐藏TableView中多余的行
    [newsView hideTableViewBotmlines];
    //注册自定制Cell
    [self registerNObjCellInTableView];
    //讲视图绑定到本视图控制器
    [self bindViewOnCurrentController:self withBindView:newsView];
    
    //创建业务逻辑模型类，调用请求网络数据的方法
    News *news=[[News alloc]init];
    //使用加载指示器
    [MBProgressHUD showHUDAddedTo:self.view  animated:YES];
    [news GET:@"http://apis.baidu.com/songshuxiansheng/news/news" successfull:^(id obj) {
        //加载网络数据，重新刷新表格
        self.dataSourceArray=[obj objectForKey:@"retData"];
        [newsView.tableView reloadData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } failed:^(NSString *reason) {
        
    }];
   
}

//注册自定制Cell
-(void)registerNObjCellInTableView
{
    UINib *nib=[UINib nibWithNibName:@"NObjCell" bundle:nil];
    [newsView.tableView registerNib:nib forCellReuseIdentifier:@"NObjCell"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma -mark UITableViewDataSource
//设置表格需要显示的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //返回数组个数
    return [self dataSourceArray].count;
}

//创建表格中的每个Cell对象
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NObjCell *cell=[tableView dequeueReusableCellWithIdentifier:@"NObjCell"];
    NSDictionary *dict=[self.dataSourceArray objectAtIndex:indexPath.row];
    //通过JSONModel，将数据封装到模型中
    NObj *obj=[[NObj alloc]initWithDictionary:dict error:nil];
    cell.title.text=obj.title;
    cell.abstract.text=obj.abstract;
    cell.url=obj.url;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    [cell.headImage sd_setImageWithURL:[NSURL URLWithString:obj.image_url] placeholderImage:nil];
    
    return cell;
    
}

//返回行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //动态计算行高
    NSString *abstractContent=[[self.dataSourceArray objectAtIndex:indexPath.row] objectForKey:@"abstract"] ;
    CGFloat height=[abstractContent boundingRectWithSize:CGSizeMake(256, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size.height+40;
    
    return height;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //通过单例获得侧滑
    AppDelegate *delegate=[self delegateInApplication];
    DDMenuController *menuVC= delegate.menuController;
    //新闻详情
    detailController =[[DetailViewController alloc]init];
    //设置title
    detailController.title=@"新闻详情";
    NObjCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    detailController.url=cell.url;
    [menuVC.navigationController pushViewController:detailController animated:YES];
}

@end
