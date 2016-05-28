//
//  DirectoryViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "DirectoryListViewController.h"
#import "MySegement.h"
#import "UIColor+HexColor.h"
#import "MyTableView.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface DirectoryListViewController ()<MyTableViewPanDelegate>

@property (nonatomic, strong) MySegement *mySegment;

@property (nonatomic, strong) MyTableView *myTableView;

@property (nonatomic, strong) NSMutableArray *reusableTableViewArray;

@end

@implementation DirectoryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _mySegment = [[MySegement alloc] initWithFrame:CGRectMake(0, 64, screenWidth, 30) withTitles:@[@"创意",@"音乐",@"电影",@"生活",@"美食",@"旅游",@"科普"]];
    
    //设置segment背景颜色
    _mySegment.itemBgColor = [UIColor whiteColor];
    
    //设置模块没有被点击的字体颜色
    _mySegment.titleColor = [UIColor darkGrayColor];
    _mySegment.selectedTitleColor = [UIColor blackColor];
    
    //设置选中的模块的字体颜色
    _mySegment.selectedItemBgColor = [UIColor whiteColor];
    
    _mySegment.underlineColor = [UIColor colorWithHexString:@"45AE8B"];
    
    _mySegment.selectedIndex = 0;
    
    [self.view addSubview:_mySegment];
    
    self.myTableView = [self createMyTableview];
    [self getDataWithType:self.myTableView];
    
    typeof(self) mySelf = self;
    self.mySegment.changeDirection = ^(SegmentDirection direction){
        MyTableView *currentView = [mySelf createMyTableview];
      
        [mySelf animateTableViewWithCurrentIndex:currentView leftDirection:direction == toLeft?YES:NO];
        [mySelf getDataWithType:currentView];

    };
    
}

#pragma mark - reusableTableViewArray 懒加载
- (NSMutableArray *)reusableTableViewArray{
    if (!_reusableTableViewArray) {
        _reusableTableViewArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _reusableTableViewArray;
}

#pragma mark - 根据点击的index改变tableview的数据类型来切换显示数据
- (void)getDataWithType:(MyTableView *)myTableView{
    if (_mySegment.selectedIndex == 0) {
        myTableView.dataType = creativity;
    }else if (_mySegment.selectedIndex == 1) {
        myTableView.dataType = music;
    }else if (_mySegment.selectedIndex == 2) {
        myTableView.dataType = film;
    }else if (_mySegment.selectedIndex == 3) {
        myTableView.dataType = life;
    }else if (_mySegment.selectedIndex == 4) {
        myTableView.dataType = delicious;
    }else if (_mySegment.selectedIndex == 5) {
        myTableView.dataType = travel;
    }else{
        myTableView.dataType = science;
    }
}

#pragma mark - 初始化mytableview
- (MyTableView *)createMyTableview{
    MyTableView *currentView = nil;
    if (self.reusableTableViewArray.count > 0) {
        currentView = [self.reusableTableViewArray lastObject];
        [self.reusableTableViewArray removeLastObject];
    }else{
        currentView = [[MyTableView alloc]initWithFrame:CGRectMake(0, 64 + 30, screenWidth, screenHeight - 94) style:UITableViewStylePlain];
        
        currentView.panDelegate = self;
        
        [self.view addSubview:currentView];
    }
    
    return currentView;
}

#pragma mark - tableview切换动画
- (void)animateTableViewWithCurrentIndex:(MyTableView *)currentTableView leftDirection:(BOOL)isLeft{
    
    CGFloat currentViewWidth = isLeft?screenWidth:-screenWidth;
    
    //不可以直接赋值给currentTableview.origin.x 因为.和=操作的话会调用set方法
    CGRect currentTableviewFrame = currentTableView.frame;
    currentTableviewFrame.origin.x = currentViewWidth;
    currentTableView.frame = currentTableviewFrame;
    
    __weak typeof(currentTableView) weakCurrentTableView = currentTableView;
    __weak typeof(self) mySelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect weakCurrentTableViewFrame = weakCurrentTableView.frame;
        weakCurrentTableViewFrame.origin.x -= currentViewWidth;
        weakCurrentTableView.frame = weakCurrentTableViewFrame;
        
        CGRect myTableViewFrame = mySelf.myTableView.frame;
        myTableViewFrame.origin.x -= currentViewWidth;
        mySelf.myTableView.frame = myTableViewFrame;
        
    } completion:^(BOOL finished) {
        [mySelf.reusableTableViewArray addObject:mySelf.myTableView];
        
        mySelf.myTableView = currentTableView;
    }];
    
}

#pragma mark - panDirectionDelegate
- (void)pandirection:(PanDirection)direction{
    //向右滑 如果已经滑到第一个 return 否则 index - 1
    if (direction == panToRight) {
        if (_mySegment.selectedIndex == 0) {
            return;
        }else{
            _mySegment.selectedIndex -= 1;
        }
    }
    //向左滑 如果已经滑到最后一个 return 否则 index + 1
    if (direction == panToLeft) {
        if (_mySegment.selectedIndex == _mySegment.titleArray.count - 1) {
            return;
        }else{
            _mySegment.selectedIndex += 1;
        }
    }
    
    //防止点中已选中的index时还会滑动
    _mySegment.lastIndex = self.mySegment.selectedIndex;
    MyTableView *currentView = [self createMyTableview];
    
    [self animateTableViewWithCurrentIndex:currentView leftDirection:direction == panToLeft?YES:NO];
    
    //显示当前被选中的index的tableview的数据
    [self getDataWithType:currentView];
    
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
