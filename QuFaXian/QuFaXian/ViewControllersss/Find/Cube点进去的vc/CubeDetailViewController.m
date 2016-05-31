//
//  CubeDetailViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/13.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "CubeDetailViewController.h"
#import "CreatorContentHeader.h"
#import "JoinIn.h"
#import "CreaterContentTableViewCell.h"
#import "ContentsStateTableViewCell.h"
#import "GroupHeader.h"
#import "GroupHeader.h"
#import "CubeDetailModel.h"
#import "HTTPRequest.h"
#import "CubeModel.h"
#import "GroupContentTableViewCell.h"
#import "DirectoryListDeatilViewController.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface CubeDetailViewController ()<ClickBtnToRefreshListDelegate, UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *_detailArray, *_cubeArray;
    
}

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) JoinIn *joinView;

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@property (strong, nonatomic) CubeDetailModel *detailModel;

@property (strong, nonatomic) GroupHeader *groupHeader;

@property (strong, nonatomic) CreatorContentHeader *creatorHeader;

@property (nonatomic, assign) int urlStart;

@end

@implementation CubeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _urlStart = 0;

    self.navigationItem.title = _detailModel.title ;
    
    _detailArray = [[NSMutableArray alloc]init];
    
    _cubeArray = [[NSMutableArray alloc]init];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CreaterContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"createrCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ContentsStateTableViewCell" bundle:nil] forCellReuseIdentifier:@"contentsCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"GroupContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"groupCell"];
    
    
    if ([_cubeModel.kind integerValue] == 1 ) {
        _creatorHeader = [[[NSBundle mainBundle]loadNibNamed:@"CreatorContentHeader" owner:nil options:nil]firstObject];
        self.tableView.tableHeaderView = _creatorHeader;
        
    }else if ([_cubeModel.kind integerValue] == 2){
        _groupHeader = [[[NSBundle mainBundle]loadNibNamed:@"GroupHeader" owner:nil options:nil]firstObject];
        self.tableView.tableHeaderView = _groupHeader;
    }
       
    //加入该站的view
    _joinView = [[[NSBundle mainBundle]loadNibNamed:@"JoinIn" owner:nil options:nil] firstObject];

    if (_cubeModel.kind.integerValue == 1) {
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
    
    NSString *_urlStr = @"http://mmmono.com/api/v3/group/%@/content/kind/%@/?";
    
    NSString *header = @"0c596a400bb611e6b2805254006fe942";
    HTTPRequest *request = [HTTPRequest shareInstance];
    
    [request getURL:[NSString stringWithFormat:_urlStr,_cubeModel.stateId,_cubeModel.kind] parameterDic:nil headerValue:header success:^(id responsObj) {
        
        
        if ([[responsObj allKeys]containsObject:@"top_meow"]) {
            NSDictionary *topMeowDic = [responsObj objectForKey:@"top_meow"];
            _detailModel = [[CubeDetailModel alloc]initWithDic:topMeowDic];
            [_detailArray addObject:_detailModel];
            NSArray *meowlist = [responsObj objectForKey:@"meow_list"];
            for (NSDictionary *dic in meowlist) {
                _detailModel = [[CubeDetailModel alloc]initWithDic:dic];
                [_detailArray addObject:_detailModel];
            }
        }else{
            NSArray *meowlist = [responsObj objectForKey:@"meow_list"];
            for (NSDictionary *dic in meowlist) {
                _detailModel = [[CubeDetailModel alloc]initWithDic:dic];
                [_detailArray addObject:_detailModel];
                
            }
        }
        
        
        if (_cubeModel.kind.integerValue == 1) {
            _creatorHeader.cubeModel = _cubeModel;
        }else{
            _groupHeader.cubeModel = _cubeModel;
            _groupHeader.imageDictArray = [responsObj objectForKey:@"recent_member"];
        }
        
        [self.tableView reloadData];
    }fail:^(NSError *error) {

    }];
    
    _urlStart ++;
}
#pragma mark - 获取cubeModel
- (void)getCubeModel{
    
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
    return 308;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  
    if (_detailModel.meowtype.integerValue == 9) {
        CreaterContentTableViewCell *fourthCell = [tableView dequeueReusableCellWithIdentifier:@"contentsCell" forIndexPath:indexPath];

        fourthCell.cubeDetail = _detailArray[indexPath.row];
        return fourthCell;
    }else if (_detailModel.meowtype.integerValue == 3){
        GroupContentTableViewCell *thirdCell = [tableView dequeueReusableCellWithIdentifier:@"groupCell" forIndexPath:indexPath];
        
        thirdCell.cubeDetail = _detailArray[indexPath.row];
        return thirdCell;
    }
    else{
        ContentsStateTableViewCell *ninethCell =[tableView dequeueReusableCellWithIdentifier:@"createrCell"];
        ninethCell.cubeDetail = _detailArray[indexPath.row];
        return ninethCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DirectoryListDeatilViewController *detailVC = [[DirectoryListDeatilViewController alloc]init];
    
    CubeDetailModel *detailModel = [[CubeDetailModel alloc]init];
    detailModel = _detailArray[indexPath.row];
    detailVC.selectedCellId = detailModel.cellId;
    
    
    [self.navigationController pushViewController:detailVC animated:YES];
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
