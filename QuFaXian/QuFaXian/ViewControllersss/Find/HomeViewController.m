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

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@property (nonatomic, strong) HomeHeaderView *homeHeaderView;
@property (nonatomic, strong) QFXHomeTableViewCell *cell;


@end

@implementation HomeViewController

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeHeaderView *homeHeaderView = [HomeHeaderView homeHeaderView];
    self.homeTableView.tableHeaderView = homeHeaderView;
    self.homeHeaderView = homeHeaderView;
    
    self.homeTableView.dataSource = self;
    self.homeTableView.delegate = self;
    
    self.homeTableView.rowHeight = 400;
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    QFXHomeTableViewCell *cell = [QFXHomeTableViewCell homeTableViewCellWithTable:tableView];
    self.cell = cell;
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
