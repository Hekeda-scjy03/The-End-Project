//
//  MyTableView.m
//  QuFaXian
//
//  Created by licong on 16/5/27.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "MyTableView.h"
#import "DirectoryListCell.h"
#import "DirectoryModel.h"
#import "HTTPRequest.h"
#import "DirectoryListDeatilViewController.h"
#import <MJRefresh.h>
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height


@implementation MyTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.dataArray = [[NSMutableArray alloc]init];
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.delegate = self;
        self.dataSource = self;
        
        //设置tableViewCell的自动识别cell高度,通过约束的改变来自动识别，必须要实现estimatedHeightForRowAtIndexPath代理方法
        self.rowHeight = UITableViewAutomaticDimension;
        
        [self registerNib:[UINib nibWithNibName:@"DirectoryListCell" bundle:nil] forCellReuseIdentifier:@"directoryListCell"];
        
        __weak typeof(self) mySelf = self;
        if (self.dataArray.count != 10) {
            self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                
                
                [mySelf getData];
            }];
        }
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            _urlStart = 0;
            
            [mySelf getData];
            
        }];

        
    }
    return self;
}

- (void)setDataType:(TableViewDataType)dataType{
    
    _dataType = dataType;
    
    self.page = 1;
    
    [_dataArray removeAllObjects];
    
    _urlStart = 0;
    
    [self getData];
}

#pragma mark - touch事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = touches.anyObject;
    
    self.startPoint = [touch locationInView:self];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    
    CGPoint endPoint = [touch locationInView:self];
    
    //判断是向左滑还是向右滑
    if ((endPoint.x - self.startPoint.x) >= screenWidth / 2 - 50){
        if ([_panDelegate respondsToSelector:@selector(pandirection:)]) {
            [_panDelegate pandirection:panToRight];
        }
    }else if((self.startPoint.x - endPoint.x) >= screenWidth / 2 + 50){
        if ([_panDelegate respondsToSelector:@selector(pandirection:)]) {
            [_panDelegate pandirection:panToLeft];
        }
    }else{
        //获取滑动时触屏的点indexpath位置
        NSIndexPath *indexPath = [self indexPathForRowAtPoint:endPoint];
        //设置选择位置的选择状态
        [self selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        
        [self.delegate tableView:self didSelectRowAtIndexPath:indexPath];
    }
}

#pragma mark -- datasource, delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return screenHeight / 6 + 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DirectoryListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"directoryListCell" forIndexPath:indexPath];

    cell.directoryModel = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark - 获取数据
- (void)getData{
    
    [self.mj_header endRefreshing];

    NSString *_urlStr = @"http://mmmono.com/api/v3/domain_category/";
    switch (self.dataType) {
        case creativity:
            _urlStr = [NSString stringWithFormat:@"%@%ld/?",_urlStr,creativity];
            break;
        case music:
            _urlStr = [NSString stringWithFormat:@"%@%ld/?",_urlStr,music];;
            break;
        case film:
            _urlStr = [NSString stringWithFormat:@"%@%ld/?",_urlStr,film];;
            break;
        case life:
            _urlStr = [NSString stringWithFormat:@"%@%ld/?",_urlStr,life];;
            break;
        case delicious:
            _urlStr = [NSString stringWithFormat:@"%@%ld/?",_urlStr,delicious];;
            break;
        case travel:
            _urlStr = [NSString stringWithFormat:@"%@%ld/?",_urlStr,travel];;
            break;
        case science:
            _urlStr = [NSString stringWithFormat:@"%@%ld/?",_urlStr,science];;
            break;
        default:
            break;
            
    }
    if (_dataArray.count != 0) {
        _urlStr = [NSString stringWithFormat:@"%@start=%d",_urlStr,_urlStart * 10];

    }
    NSString *header = @"0c596a400bb611e6b2805254006fe942";
    HTTPRequest *request = [HTTPRequest shareInstance];
    
    typeof(self) mySelf = self;

    [request getURL:_urlStr parameterDic:nil headerValue:header success:^(id responsObj) {
        
        NSArray *meows = [responsObj objectForKey:@"meows"];
        
            for (NSDictionary *dic in meows) {
                DirectoryModel *directoryModel = [[DirectoryModel alloc]initWithDic:dic];
                [_dataArray addObject:directoryModel];
                
            }
        
        [mySelf.mj_footer endRefreshing];
        [mySelf reloadData];
        
    } fail:^(NSError *error) {
        NSLog(@"Directory Error: %@",error);
    }];
    
    _urlStart++;
    
}

#pragma mark - 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DirectoryListDeatilViewController *dirListDetailVC = [[DirectoryListDeatilViewController alloc]init];

    DirectoryModel *directoryModel = [[DirectoryModel alloc]init];
    directoryModel = _dataArray[indexPath.row];
    dirListDetailVC.selectedCellId = directoryModel.id;
    

//    detailVC.kind = creatorModel.kind;
//    detailVC.navigationItem.title = creatorModel.name;
    
    [self.selfVC.navigationController pushViewController:dirListDetailVC animated:YES];
}
@end
