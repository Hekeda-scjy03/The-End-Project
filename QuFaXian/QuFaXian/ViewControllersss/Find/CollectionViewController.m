//
//  CollectionViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/30.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "CollectionViewController.h"
#import "SpecialTableViewCell.h"
#import "HTTPRequest.h"
#import "SpecialHeader.h"
#import "SpecialCellModel.h"
#import "SpecialEntityList.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface CollectionViewController ()<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *_specialArray;
}

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) SpecialCellModel *cellModel;

@property (strong, nonatomic) SpecialHeader *specialHeader;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _specialArray = [[NSMutableArray alloc]init];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SpecialTableViewCell" bundle:nil] forCellReuseIdentifier:@"specialCell"];
    
    
    _specialHeader = [[[NSBundle mainBundle]loadNibNamed:@"SpecialHeader" owner:nil options:nil]firstObject];
    self.tableView.tableHeaderView = _specialHeader;
    
    [self getData];
    
}

#pragma mark - 获取数据
- (void)getData{
    
    
    NSString *header = @"0c596a400bb611e6b2805254006fe942";
    HTTPRequest *request = [HTTPRequest shareInstance];
   
    [request getURL:[NSString stringWithFormat:@"http://mmmono.com/api/v3/collection/%@/?",self.selectedCellId] parameterDic:nil headerValue:header success:^(id responsObj) {
        
        _cellModel = [[SpecialCellModel alloc] initWithDic:responsObj];
        
        _specialHeader.specialModel = _cellModel;

        [self.tableView reloadData];
    }fail:^(NSError *error) {
        
    }];
    
}

#pragma mark - tableview delegate datasourse
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _cellModel.entityList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 398;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SpecialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"specialCell" forIndexPath:indexPath];
    
    cell.listModel = _cellModel.entityList[indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
