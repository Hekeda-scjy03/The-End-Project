//
//  HomeViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/6.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeaderView.h"
#import "QFXVideoViewController.h"
#import "QFXHomeTableViewCell.h"
#import "HTTPRequest.h"
#import "QFXHomeDataModel.h"
#import "QFXHomeDetailsViewController.h"
#import <MJRefresh.h>
#import <SDImageCache.h>




@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@property (nonatomic, strong) HomeHeaderView *homeHeaderView;

@property (nonatomic, strong) NSMutableArray *hoemDataListArray;
@property (nonatomic, strong) NSMutableArray *dataID;

// 当前时间
@property (nonatomic, copy) NSString *currenDate;

@property (nonatomic, copy) NSString *startValue;




@end

@implementation HomeViewController
// 数据的ID，作为跳转webView的参数
- (NSMutableArray *)dataID
{
    if (!_dataID) {
        _dataID = [NSMutableArray array];
    }
    return _dataID;
}

#pragma mark - 获取当前日期
- (NSString *)getcurrenDate
{
    
    NSDate *currenDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYYMMdd"];
    NSString *dateStr = [dateFormatter stringFromDate:currenDate];
    
    return dateStr;
}


#pragma mark - 网络请求
- (void)httpRequest
{
    HTTPRequest *httpRequest = [[HTTPRequest alloc] init];
    NSString *urlStr = @"http://mmmono.com/api/v3/tea/0/";
    
    
    [httpRequest getURL:urlStr parameterDic:nil headerValue:nil success:^(id responsObj) {
        
        self.hoemDataListArray = [QFXHomeDataModel homeDataModelWithDict:responsObj];
        
        // 刷新表格
        [self.homeTableView reloadData];
    
    } fail:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeHeaderView *homeHeaderView = [HomeHeaderView homeHeaderView];
    self.homeTableView.tableHeaderView = homeHeaderView;
    self.homeHeaderView = homeHeaderView;
    
    self.homeTableView.dataSource = self;
    self.homeTableView.delegate = self;
    
    self.homeTableView.rowHeight = 400;
    
    // 获取当前时间
    self.currenDate = [self getcurrenDate];
    
    
    // 请求数据
    [self httpRequest];
    
    
    __weak typeof(self) mySelf = self;
    // 下拉刷新
    self.homeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [mySelf pulldownRefresh];
    }];
    
    // 上拉加载
    self.homeTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [mySelf pullupRefresh];
    }];
}


#pragma mark - viewDidAppear
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.homeHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.hoemDataListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QFXEntity_List *model = self.hoemDataListArray[indexPath.row];
    
    QFXHomeTableViewCell *cell = [QFXHomeTableViewCell homeTableViewCellWithTable:tableView];
    
    cell.homeDataModel = model;
    
    tableView.rowHeight = cell.height;
    
    return cell;
}
#pragma mark - UITableViewDelegate
// 选中某行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QFXHomeDetailsViewController *homeDetailsVC = [[QFXHomeDetailsViewController alloc] init];
    
    QFXEntity_List *model = self.hoemDataListArray[indexPath.row];
    
    homeDetailsVC.dataID = model.meow.ID;
    
    [self.navigationController pushViewController:homeDetailsVC animated:YES];
    
    
    
//    QFXVideoDetailsViewController *videoDetailsVC = [[QFXVideoDetailsViewController alloc] init];
//    
//    QFXVideoMeowsModel *model = self.videoDataListArray[indexPath.row];
//    
//    videoDetailsVC.dataID = model.ID;
//    
//    [self.navigationController pushViewController:videoDetailsVC animated:YES];
}


#pragma mark - 下拉刷新
- (void)pulldownRefresh
{
     __weak typeof(self) mySelf = self;
    //刷新开始
    [mySelf.homeTableView.mj_header beginRefreshing];
    
    HTTPRequest *httpRequest = [[HTTPRequest alloc] init];
    NSString *urlStr = @"http://mmmono.com/api/v3/recommendation/";
    
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSString *headerValue = @"d9c7d21e128711e6a378525400a8f685";
    
    
    QFXHomeTeaModel *homeTea;
    
    // 获取当前时间
    NSString *currenDate = [self getcurrenDate];
    if ([self.currenDate isEqualToString:currenDate]) {
        
    }else{
        homeTea.start = NULL;
    }
    
    if (homeTea.start.length == 0) {
        //        NSLog(@">>>>%lu",(unsigned long)homeTea.start.length);
        [parameter setValue:@"0" forKey:@"start"];
    }else{
        [parameter setObject:homeTea.start forKey:@"start"];
    }
    
    [httpRequest getURL:urlStr parameterDic:parameter headerValue:headerValue success:^(id responsObj) {
        
        // entity_list数组
        NSMutableArray *refreshArray = [QFXHomeTeaModel refreshDataModelWithDict:responsObj];
        
        // 判断是否为空
        if (refreshArray.count != 0) {
            
            for (QFXHomeMeowModel *meow in self.hoemDataListArray) {
                [refreshArray insertObject:meow atIndex:0];
            }
        }
        self.hoemDataListArray = refreshArray;
        [self.homeTableView reloadData];
        
        
        //刷新结束
        [mySelf.homeTableView.mj_footer endRefreshing];
    } fail:^(NSError *error) {
        
        NSLog(@"error = %@",error);
        [mySelf.homeTableView.mj_footer endRefreshing];
        
    }];


    //刷新结束
    [mySelf.homeTableView.mj_header endRefreshing];
}

#pragma mark - 上拉加载
- (void)pullupRefresh
{
    __weak typeof(self) mySelf = self;
    //刷新开始
    [mySelf.homeTableView.mj_footer beginRefreshing];

    HTTPRequest *httpRequest = [[HTTPRequest alloc] init];
    NSString *urlStr = @"http://mmmono.com/api/v3/recommendation/";
    
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSString *headerValue = @"d9c7d21e128711e6a378525400a8f685";
    
    
    QFXHomeTeaModel *homeTea;
    
    // 获取当前时间
    NSString *currenDate = [self getcurrenDate];
    if ([self.currenDate isEqualToString:currenDate]) {
        
    }else{
        homeTea.start = NULL;
    }
    
    if (homeTea.start.length == 0) {
        //        NSLog(@">>>>%lu",(unsigned long)homeTea.start.length);
        [parameter setValue:@"0" forKey:@"start"];
    }else{
        [parameter setObject:homeTea.start forKey:@"start"];
    }
    
    [httpRequest getURL:urlStr parameterDic:parameter headerValue:headerValue success:^(id responsObj) {
        
        //        NSLog(@"====%@",responsObj);
        
        // entity_list数组
        NSMutableArray *refreshArray = [QFXHomeTeaModel refreshDataModelWithDict:responsObj];
        
        
        // 判断是否为空
        if (refreshArray.count != 0) {
            
            for (QFXHomeMeowModel *meow in self.hoemDataListArray) {
                [refreshArray insertObject:meow atIndex:refreshArray.count - 1];
            }
            
            //            for (QFXHomeMeowModel *refreshModel in refreshArray) {
            //
            //
            //
            //                [self.hoemDataListArray insertObject:refreshModel atIndex:0];
            //
            //                QFXHomeTeaModel *teaModel = [[QFXHomeTeaModel alloc] init];
            //
            //                teaModel.entity_list = self.hoemDataListArray;
            //            }
            
            
            // 刷新表格
        }
        
        self.hoemDataListArray = refreshArray;
        [self.homeTableView reloadData];
        
        //        // 让UItableView的最后一行滚动到最上面
        //        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:refreshArray.count - 1 inSection:0];
        //        [self.videoTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        //刷新结束
        [mySelf.homeTableView.mj_footer endRefreshing];
        
    } fail:^(NSError *error) {
        
        NSLog(@"error = %@",error);
        
    }];

    //刷新结束
    [mySelf.homeTableView.mj_footer endRefreshing];

    
}

#pragma mark - 刷新的具体实现
- (void)refreshData
{
     __weak typeof(self) mySelf = self;
    HTTPRequest *httpRequest = [[HTTPRequest alloc] init];
    NSString *urlStr = @"http://mmmono.com/api/v3/recommendation/";
    
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSString *headerValue = @"d9c7d21e128711e6a378525400a8f685";
    
    
    QFXHomeTeaModel *homeTea;
    
    // 获取当前时间
    NSString *currenDate = [self getcurrenDate];
    if ([self.currenDate isEqualToString:currenDate]) {
        
    }else{
        homeTea.start = NULL;
    }
    
    if (homeTea.start.length == 0) {
        //        NSLog(@">>>>%lu",(unsigned long)homeTea.start.length);
        [parameter setValue:@"0" forKey:@"start"];
    }else{
        [parameter setObject:homeTea.start forKey:@"start"];
    }
    
    [httpRequest getURL:urlStr parameterDic:parameter headerValue:headerValue success:^(id responsObj) {
        
//        NSLog(@"====%@",responsObj);
        
        // entity_list数组
        NSMutableArray *refreshArray = [QFXHomeTeaModel refreshDataModelWithDict:responsObj];
        
        
        // 判断是否为空
        if (refreshArray.count != 0) {
            
            for (QFXHomeMeowModel *meow in self.hoemDataListArray) {
                [refreshArray insertObject:meow atIndex:refreshArray.count];
            }
            
            //            for (QFXHomeMeowModel *refreshModel in refreshArray) {
            //
            //
            //
            //                [self.hoemDataListArray insertObject:refreshModel atIndex:0];
            //
            //                QFXHomeTeaModel *teaModel = [[QFXHomeTeaModel alloc] init];
            //
            //                teaModel.entity_list = self.hoemDataListArray;
            //            }
            
            
            // 刷新表格
            [self.homeTableView reloadData];
        }
        
    } fail:^(NSError *error) {
        
        NSLog(@"error = %@",error);
        
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
