//
//  MineViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/6.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "MineViewController.h"
#import "MineHeaderView.h"
#import "QFXMineTableViewCell.h"
#import "SettingMessage.h"

@interface MineViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mineTableView;
@property (nonatomic, strong) NSArray *settingMessageArray;
@end

@implementation MineViewController
- (NSArray *)settingMessageArray
{
    if (!_settingMessageArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"settingMessage.plist" ofType:nil];
        
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayModel = [NSMutableArray array];
        
        for (NSDictionary *dict in arrayDict)
        {
            //把字典转成模型
            SettingMessage *model = [SettingMessage settingMessageWithDict:dict];
            
            [arrayModel addObject:model];
        }
        _settingMessageArray = arrayModel;
    }
    return _settingMessageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mineTableView.dataSource = self;
    self.mineTableView.delegate = self;
    self.mineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    MineHeaderView *mineHeaderView = [MineHeaderView mineHeaderView];
    self.mineTableView.tableHeaderView = mineHeaderView;
    
    self.mineTableView.rowHeight = 51.f;

    
    self.view.backgroundColor = [UIColor brownColor];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.settingMessageArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingMessage *model = self.settingMessageArray[indexPath.row];
    
    QFXMineTableViewCell *cell = [QFXMineTableViewCell mineTableViewCellWithTable:tableView];
    
    if (indexPath.row <=2) {
        cell.switchBtn.hidden = NO;
    }else {
        cell.switchBtn.hidden = YES;
    }
    cell.settingMessageModel = model;
    return cell;
}
#pragma mark - UITableViewDelegate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    MineDataModel *model = self.mineDataArray[indexPath.row];
//    return model.cellHeight;
//}


//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
//{
//    // 预估高度
//    return 1000.f;
//}


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
