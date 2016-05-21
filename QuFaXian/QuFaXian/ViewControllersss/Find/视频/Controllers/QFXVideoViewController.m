//
//  QFXVideoViewController.m
//  QuFaXian
//
//  Created by hzy on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXVideoViewController.h"
#import "QFXVideoTableViewCell.h"
#import "QFXVideoDataModel.h"

@interface QFXVideoViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *videoTableView;
@property (nonatomic, strong) NSArray *videoDataListArray;


@end

@implementation QFXVideoViewController


#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoTableView.dataSource = self;
    self.videoTableView.delegate = self;
    
//    // 设置行高
    self.videoTableView.rowHeight = 235;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QFXVideoTableViewCell *cell = [QFXVideoTableViewCell videoTableViewCell:tableView];
    return cell;
}

#pragma mark - UITableViewDelegate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    QFXVideoDataModel *videoDataModel = self.videoDataListArray[indexPath.row];
//    return videoDataModel.cellHeight;
//}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
{
    // 预估高度
    return 235.f;
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
