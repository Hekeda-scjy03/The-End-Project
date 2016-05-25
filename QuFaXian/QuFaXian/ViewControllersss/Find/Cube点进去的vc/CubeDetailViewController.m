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
#import "CreaterContentTableViewCell.h"
#import "ContentsStateTableViewCell.h"
#import "GroupHeader.h"
#import "CreaterContentHeader.h"
#import "GroupHeader.h"
#import "CubeDetailModel.h"
#import "HTTPRequest.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface CubeDetailViewController ()<ClickBtnToRefreshListDelegate, UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *_detailArray;
}

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) JoinIn *joinView;

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@property (strong, nonatomic) CubeDetailModel *detailModel;

@end

@implementation CubeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _detailModel.title ;
    
    _detailArray = [[NSMutableArray alloc]init];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CreaterContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"createrCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ContentsStateTableViewCell" bundle:nil] forCellReuseIdentifier:@"contentsCell"];
    
    if (_detailModel.kind.intValue == 1) {
        CreaterContentHeader *createrHeader = [[[NSBundle mainBundle]loadNibNamed:@"CreaterContentHeader" owner:nil options:nil]firstObject];
        self.tableView.tableHeaderView = createrHeader;
        
    }else if (_detailModel.kind.intValue == 2){
        GroupHeader *groupHeader = [[[NSBundle mainBundle]loadNibNamed:@"GroupHeader" owner:nil options:nil]firstObject];
        self.tableView.tableHeaderView = groupHeader;
    }
    
    //加入该站的view
    _joinView = [[[NSBundle mainBundle]loadNibNamed:@"JoinIn" owner:nil options:nil] firstObject];
    NSLog(@"kind  %@",self.kind);
    if (self.kind.integerValue == 1) {
        [_joinView setTitle:@"加入该站"];
    }else{
        [_joinView setTitle:@"加入小组"];
    }
    _joinView.frame = CGRectMake(0, screenHeight - 50, screenWidth, 50);
    
    
    [_joinView addTarget:self action:@selector(focusMethod)];
    [self.view addSubview:_joinView];
    
    [self getData];

}

#pragma mark - 获取数据
- (void)getData{
    NSString *header = @"0c596a400bb611e6b2805254006fe942";
    HTTPRequest *request = [HTTPRequest shareInstance];
    [request getURL:[NSString stringWithFormat:@"http://mmmono.com/api/v3/group/%@/content/kind/%@/?",self.id,self.kind] parameterDic:nil headerValue:header success:^(id responsObj) {
        
        
        NSArray *meowlist = [responsObj objectForKey:@"meow_list"];
            for (NSDictionary *dic in meowlist) {
                _detailModel = [[CubeDetailModel alloc]initWithDic:dic];
                [_detailArray addObject:_detailModel];
            }
        [self.tableView reloadData];
    }fail:^(NSError *error) {

    }];
}

#pragma mark - 加入小组 关注内容站等
- (void)focusMethod{
    NSLog(@"加入该站");
}

#pragma mark - tableview delegate datasourse
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _detailArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return screenHeight * 0.7 + 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (_detailModel.meowtype.integerValue == 9) {
        CreaterContentTableViewCell *fourthCell = [tableView dequeueReusableCellWithIdentifier:@"createrCell" forIndexPath:indexPath];
        fourthCell.cubeDetail = _detailArray[indexPath.row];
        return fourthCell;
    }else{
        ContentsStateTableViewCell *ninethCell =[tableView dequeueReusableCellWithIdentifier:@"contentsCell"];
        ninethCell.cubeDetail = _detailArray[indexPath.row];
        return ninethCell;
    }
}

#pragma mark - 设置header
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (_detailModel.kind.integerValue == 1 && section == 0) {
        return screenWidth / 3 * 2 ;
    }else if (_detailModel.kind.integerValue == 2 && section == 0){
        return screenWidth * 0.4;
    }
    return 0;
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
