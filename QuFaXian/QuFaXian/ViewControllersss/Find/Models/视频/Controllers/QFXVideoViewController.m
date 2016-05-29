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


@interface QFXVideoViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *videoTableView;
@property (nonatomic, strong) NSMutableArray *videoDataListArray;
@property (nonatomic, strong) NSMutableArray *dataID;


@end

@implementation QFXVideoViewController
- (NSMutableArray *)dataID
{
    if (!_dataID) {
        _dataID = [NSMutableArray array];
    }
    return _dataID;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoTableView.dataSource = self;
    self.videoTableView.delegate = self;
    self.videoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 请求数据
    [self httpRequest];
    
    self.navigationItem.title = @"视频";
    
}

#pragma mark - 网络请求
- (void)httpRequest
{
    HTTPRequest *httpRequest = [[HTTPRequest alloc] init];
    NSString *urlStr = @"http://mmmono.com/api/v3/meow/pool/";
    
    NSDictionary *parameter = @{@"meow_type":@"7"};
    NSString *headerValue = @"d9c7d21e128711e6a378525400a8f685";
    
    [httpRequest getURL:urlStr parameterDic:parameter headerValue:headerValue success:^(id responsObj) {
        
        self.videoDataListArray = [QFXVideoDataModel videoDataModelWithDict:responsObj];
        
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
    [self.dataID addObject:model.ID];
//    NSLog(@"====%@",self.dataID);
   
    
    tableView.rowHeight = cell.height;
    
    return cell;
    
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QFXVideoDetailsViewController *videoDetailsVC = [[QFXVideoDetailsViewController alloc] init];
    
    videoDetailsVC.dataID = self.dataID[indexPath.row];
//    NSLog(@"====%@",videoDetailsVC.dataID);
    
    [self.navigationController pushViewController:videoDetailsVC animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
