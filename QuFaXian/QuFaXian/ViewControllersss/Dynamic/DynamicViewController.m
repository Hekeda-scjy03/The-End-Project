
//
//  DynamicViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/6.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "DynamicViewController.h"
#import "DynamicHeaderView.h"
#import "QFXDynmaicCell.h"


@interface DynamicViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *dymaicTableView;

@end

@implementation DynamicViewController
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"动态";
    
    self.view.backgroundColor = [UIColor whiteColor];
    DynamicHeaderView *dynmaicHeader = [DynamicHeaderView dynamicHeaderView];
    self.dymaicTableView.tableHeaderView = dynmaicHeader;
    
    self.dymaicTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dymaicTableView.rowHeight = 96.f;
    
    self.dymaicTableView.delegate = self;
    self.dymaicTableView.dataSource = self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QFXDynmaicCell *cell = [QFXDynmaicCell dynmaicCellWithTableView:tableView];
    return cell;
}


#pragma mark - UITableViewDelegate


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
