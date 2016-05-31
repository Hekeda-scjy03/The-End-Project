//
//  CreatorListViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "CreatorListViewController.h"
#import "CreatorModel.h"
#import "FindCreatorListTableViewCell.h"
#import "HTTPRequest.h"
#import "CubeModel.h"
#import "CubeDetailViewController.h"
#import <MJRefresh.h>
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface CreatorListViewController ()<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *_creatorListArray;
    
    
}

@property (nonatomic, assign) int urlStart;

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation CreatorListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _urlStart = 0;
    
    self.navigationItem.title = @"趣发现造物主";
    
    _creatorListArray = [[NSMutableArray alloc]init];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FindCreatorListTableViewCell" bundle:nil] forCellReuseIdentifier:@"creatorList"];
    [self getData];
    
    __weak typeof(self) mySelf = self;
    if (_creatorListArray.count != 20) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            
            
            [mySelf getData];
        }];
    }
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        
        [mySelf getData];
        
    }];
}

#pragma mark - 获取数据
- (void)getData{
    
    [self.tableView.mj_footer endRefreshing];
    
    NSString *_urlStr = @"http://mmmono.com/api/v3/explore/mod/30/shuffled?";
    if (_creatorListArray.count != 0) {
        _urlStr = [NSString stringWithFormat:@"%@start=%d",_urlStr,_urlStart * 10];

    }else{
        _urlStr = _urlStr;
    }
    
    NSString *header = @"0c596a400bb611e6b2805254006fe942";
    HTTPRequest *request = [HTTPRequest shareInstance];
    [request getURL:_urlStr parameterDic:nil headerValue:header success:^(id responsObj) {
        
        
        NSArray *entityList = [responsObj objectForKey:@"entity_list"];
        for (NSDictionary *dic in entityList) {
            CreatorModel *creatorModel = [[CreatorModel alloc]initWithDic:dic];
            [_creatorListArray addObject:creatorModel];
        }
        
        [self.tableView.mj_header endRefreshing];
        
        [self.tableView reloadData];
    }fail:^(NSError *error) {
        
    }];
    
    _urlStart++;

}

#pragma mark - tableview delegate datasourse
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _creatorListArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return screenHeight / 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FindCreatorListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"creatorList" forIndexPath:indexPath];
    cell.creatorModel = _creatorListArray[indexPath.row];
    return cell;
    
}

#pragma mark - 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CubeDetailViewController *detailVC = [[CubeDetailViewController alloc] initVCwithItemType:VCItemTypeShare|VCItemTypeMore withNavTitle:0];
    
    CreatorModel *creatorModel = _creatorListArray[indexPath.row];
    CubeModel *cubeModel = [[CubeModel alloc]init];
    cubeModel.stateId = creatorModel.id;
    cubeModel.kind = creatorModel.kind;
    detailVC.cubeModel = cubeModel;
    
   
    [self.navigationController pushViewController:detailVC animated:YES];
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
