//
//  QFXVideoViewController.m
//  QuFaXian
//
//  Created by hzy on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXVideoViewController.h"
#import "QFXVideoTableViewCell.h"
#import "HTTPRequest.h"
#import "QFXVideoDataModel.h"
#import "QFXVideoDetailsViewController.h"
#import <MJRefresh.h>



@interface QFXVideoViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *videoTableView;
@property (nonatomic, strong) NSMutableArray *videoDataListArray;
@property (nonatomic, strong) NSMutableArray *dataID;

@property (nonatomic, weak) UITableViewCell *myCell;


@property (nonatomic, copy) NSString *start;
@property (nonatomic, assign) int sta;




// 当前时间
@property (nonatomic, copy) NSString *currenDate;

@end

@implementation QFXVideoViewController
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



#pragma mark - viewDidLoad

//- (void)loadView
//{
//    [super loadView];
//    NSLog(@"1111");
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@">>>>%@",self.start);
    
    self.videoTableView.dataSource = self;
    self.videoTableView.delegate = self;
    self.videoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 请求数据
    [self httpRequest];
    
    
    self.navigationItem.title = @"视频";
    
    
    // 获取当前时间
    self.currenDate = [self getcurrenDate];
    
    __weak typeof(self) mySelf = self;
    // 下拉刷新
    
    int sta = 11;
    self.sta = sta;
    
    NSLog(@"===%@",self.start);
    self.videoTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [mySelf pulldownRefresh:self.start];
    }];
    
    // 上拉加载
    self.videoTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       
        NSString *start = [NSString stringWithFormat:@"%d",self.sta];
         NSLog(@"===%@",start);
        [mySelf pullupRefresh:start];
        
        self.sta += 1;
    }];
    
}
#pragma mark - 网络请求
- (void)httpRequest
{
    HTTPRequest *httpRequest = [[HTTPRequest alloc] init];
    NSString *urlStr = @"http://mmmono.com/api/v3/meow/pool/";
    
    NSDictionary *parameter = @{@"meow_type":@"7"};
    NSString *headerValue = @"d9c7d21e128711e6a378525400a8f685";
    
    [httpRequest getURL:urlStr parameterDic:parameter headerValue:headerValue success:^(id responsObj) {
        

        QFXVideoDataModel *vidoeDataModel = [[QFXVideoDataModel alloc] init];
        
        self.videoDataListArray = [vidoeDataModel videoDataModelWithDict:responsObj];
        
        // 拿到数据后刷新tableView
        [self.videoTableView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.videoDataListArray.count;
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QFXVideoMeowsModel *model = self.videoDataListArray[indexPath.row];
    
    QFXVideoTableViewCell *cell = [QFXVideoTableViewCell videoTableViewCell:tableView];
    
    cell.videoData = model;

    tableView.rowHeight = cell.height;
    
    return cell;
    
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QFXVideoDetailsViewController *videoDetailsVC = [[QFXVideoDetailsViewController alloc] init];
    
    QFXVideoMeowsModel *model = self.videoDataListArray[indexPath.row];
    
    videoDetailsVC.dataID = model.ID;
    
    [self.navigationController pushViewController:videoDetailsVC animated:YES];
}

#pragma mark - 下拉刷新
- (void)pulldownRefresh:(NSString *)start
{
    __weak typeof(self) mySelf = self;
    //刷新开始
    [mySelf.videoTableView.mj_header beginRefreshing];
    
    //刷新结束
    [mySelf.videoTableView.mj_header endRefreshing];
}

#pragma mark - 上拉加载
- (void)pullupRefresh:(NSString *)start
{
    [self refreshData:start];
}

#pragma mark - 刷新的具体实现
- (void)refreshData:(NSString *)start
{
    __weak typeof(self) mySelf = self;
    //刷新开始
    [mySelf.videoTableView.mj_footer beginRefreshing];
    
    HTTPRequest *httpRequest = [[HTTPRequest alloc] init];
    
    
    NSString *urlStr = [NSString stringWithFormat:@"http://mmmono.com/api/v3/meow/pool/?channel=explore&meow_type=7&start=%@",start];
    // 请求头的值
    NSString *headerValue = @"d9c7d21e128711e6a378525400a8f685";

    [httpRequest getURL:urlStr parameterDic:nil headerValue:headerValue success:^(id responsObj) {
        
        // meows数组
        QFXVideoDataModel *videoDataModel = [[QFXVideoDataModel alloc] init];
       
        NSMutableArray *refreshArray = [videoDataModel videoDataModelWithDict:responsObj];
        
        for (QFXVideoMeowsModel *meows in self.videoDataListArray) {
                
            [refreshArray insertObject:meows atIndex:refreshArray.count - 1];
    }
        
        self.videoDataListArray = refreshArray;
        [self.videoTableView reloadData];
        
//        // 让UItableView的最后一行滚动到最上面
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:refreshArray.count - 1 inSection:0];
//        [self.videoTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        //刷新结束
        [mySelf.videoTableView.mj_footer endRefreshing];
        
    } fail:^(NSError *error) {
        
        NSLog(@"error = %@",error);
        //刷新结束
        [mySelf.videoTableView.mj_footer endRefreshing];

        
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
