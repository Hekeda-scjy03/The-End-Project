//
//  CubeDetailViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/13.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "CubeDetailViewController.h"
#import "CreaterContentHeader.h"
#import "JoinIn.h"
#import "GroupContentTableViewCell.h"
#import "CreaterContentTableViewCell.h"
#import "ContentsStateTableViewCell.h"
#import "GroupHeader.h"
#import "CreaterContentHeader.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface CubeDetailViewController ()<ClickBtnToRefreshListDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) JoinIn *joinView;

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@end

@implementation CubeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"GroupContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"groupCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CreaterContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"createrCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ContentsStateTableViewCell" bundle:nil] forCellReuseIdentifier:@"contentsCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"GroupHeader" bundle:nil] forHeaderFooterViewReuseIdentifier:@"groupHeader"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CreaterContentHeader" bundle:nil] forHeaderFooterViewReuseIdentifier:@"otherHeader"];
    
    _joinView = [[[NSBundle mainBundle]loadNibNamed:@"JoinIn" owner:nil options:nil] firstObject];
    _joinView.frame = CGRectMake(0, screenHeight - 50, screenWidth, 50);
    [_joinView setTitle:@"关注该站"];
    [self.view addSubview:_joinView];
    
    self.tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(focusMethod)];
    [self.joinView addGestureRecognizer:self.tap];
}

#pragma mark - 加入小组 关注内容站等
- (void)focusMethod{
    
}

#pragma mark - tableview delegate datasourse
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return screenWidth * 0.65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        GroupContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"groupCell" forIndexPath:indexPath];
    
    return cell;
}



#pragma mark - 切换cell
- (void)clickBtnToRefreshList{
    
    
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
