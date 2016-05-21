//
//  FindViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/6.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "FindViewController.h"
#import "FindCubeCollectionViewCell.h"
#import "FooterCollectionReusableView.h"
#import "CubeDetailViewController.h"
#import "TopicsFooterCollectionReusableView.h"
#import "ListBtn.h"
#import "UIColor+HexColor.h"
#import "CreatorListViewController.h"
#import "DirectoryListViewController.h"
#import "HTTPRequest.h"
#import "CubeModel.h"
#import "SpecialModel.h"
#import "ActivityModel.h"
#import <MJRefresh.h>
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface FindViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{
    
    ListBtn *_right,*_left;
    
    NSMutableArray *_array;
}

@property (strong, nonatomic) UICollectionView *collectionView;


@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _array = [[NSMutableArray alloc]init];
    
    [self initButton];
    [self initCollectionView];
    [self getData];
}

#pragma mark - 获取网络数据
- (void)getData{
    NSString *urlStr = @"";
    switch (_array.count) {
        case 0:
            urlStr = @"http://mmmono.com/api/v3/new_explore/?";
            
            break;
        case 4:
            urlStr = @"http://mmmono.com/api/v3/new_explore/?start=2%3B8%3B2%3B1";
            break;
        case 8:
            urlStr = @"http://mmmono.com/api/v3/new_explore/?start=3%3B16%3B4%3B2";
            break;
        case 12:
            urlStr = @"http://mmmono.com/api/v3/new_explore/?start=4%3B24%3B6%3B3";
            break;
        case 16:
            urlStr = @"http://mmmono.com/api/v3/new_explore/?start=5%3B32%3B8%3B4";
            break;
            
            
        default:
            break;
    }
    NSString *header = @"0c596a400bb611e6b2805254006fe942";
    HTTPRequest *request = [HTTPRequest shareInstance];
    [request getURL:urlStr parameterDic:nil headerValue:header success:^(id responsObj) {
        
        NSArray *modlist = [responsObj objectForKey:@"mod_list"];
        
        for (int i=0; i<modlist.count; i++) {
            NSDictionary *tempDic = modlist[i];
            NSArray *entitylist = [tempDic objectForKey:@"entity_list"];
            if (i % 2 == 0) {
                NSMutableArray *cellArray = [[NSMutableArray alloc]init];
                for (NSDictionary *dic in entitylist) {
                    
                    CubeModel *cube = [[CubeModel alloc]initWithDic:dic];
                    [cellArray addObject:cube];
                }
                [_array addObject:cellArray];
            }else if (i % 4 == 1){
                NSDictionary *dataDict = entitylist [0];
                NSDictionary *initDcit = nil;
                if (_array.count == 1) {
                    NSDictionary *tempDic1 = [dataDict objectForKey:@"meow"];
                    initDcit = [tempDic1 objectForKey:@"ref_campaign"];
                }else{
                    initDcit = [dataDict objectForKey:@"campaign"];
                }
                ActivityModel *activity = [[ActivityModel alloc]initWithDic:initDcit];
                [_array addObject:activity];
                
            }else{
                SpecialModel *special = [[SpecialModel alloc]initWithDic:entitylist[0]];
                [_array addObject:special];
            }
        }
        [_collectionView.mj_footer endRefreshing];
        [_collectionView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"222 + %@",error);
    }];
    
}


#pragma mark - 初始化两个button
- (void)initButton{
    CGFloat height = 64.f;
    CGFloat width = screenWidth / 2;
    _left = [[[NSBundle mainBundle] loadNibNamed:@"ListBtn" owner:nil options:nil] firstObject];
    _left.frame = CGRectMake(0, 64, width, height);
    [_left addTarget:self action:@selector(getDirectoryList) backgroundColor:[UIColor colorWithHexString:@"EFE326"] buttonTitle:@"趣发现目录" titleColor:[UIColor blackColor]  arrowImage:@"browser-forward-black"];
    [self.view addSubview:_left];
    
    CGFloat y = CGRectGetMinY(_left.frame);
    _right = _left = [[[NSBundle mainBundle] loadNibNamed:@"ListBtn" owner:nil options:nil] firstObject];
    _right.frame = CGRectMake(width, y, width, height);
    [_right addTarget:self action:@selector(getCreatorList) backgroundColor:[UIColor blackColor] buttonTitle:@"趣发现造物主" titleColor:[UIColor whiteColor] arrowImage:@"icon-arrow-right-white"];
    [self.view addSubview:_right];
}

#pragma mark - btn 点击事件
- (void)getDirectoryList{
    [self getData];
    DirectoryListViewController *listVC = [[DirectoryListViewController alloc] init];
    [self.navigationController pushViewController:listVC animated:YES];
}

- (void)getCreatorList{
    CreatorListViewController *listVC = [[CreatorListViewController alloc]init];
    [self.navigationController pushViewController:listVC animated:YES];
}

#pragma mark - 初始化collectionView 注册cell footer
- (void)initCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0.0f;
    layout.minimumInteritemSpacing = 0.0f;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    CGFloat y = CGRectGetMaxY(_left.frame);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, y, screenWidth, screenHeight - y - 49) collectionViewLayout:layout];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_collectionView];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"FindCubeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cubeCell"];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"FooterCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerCell"];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"TopicsFooterCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"topicFooter"];
    
    
    __weak typeof(self) mySelf = self;
   
    if (_array.count != 20) {
        self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            
            [mySelf getData];
        }];
    }
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_array removeAllObjects];
        [mySelf getData];
    }];
   
//    self.collectionView.mj_header = []
    
}

#pragma mark - collection delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _array.count / 2;
}
//item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FindCubeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cubeCell" forIndexPath:indexPath];
    NSArray *tempArray = _array[indexPath.section * 2];
    cell.cubeModel = tempArray[indexPath.row];
    return cell;
 
}

//设置Item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(screenWidth / 2, screenHeight / 3);
}

#pragma mark - 设置footer
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section % 2 !=0) {
        TopicsFooterCollectionReusableView *topicFooter = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"topicFooter" forIndexPath:indexPath];
            topicFooter.specialModel = _array[indexPath.section * 2 + 1];
        return topicFooter;
    }else{
        FooterCollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footerCell" forIndexPath:indexPath];
            footer.activityModel = _array[indexPath.section * 2 + 1];
        return footer;
    }
}
//设置footer大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(screenWidth, 120);
}

#pragma mark - 点击collectionview
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CubeDetailViewController *cubeDetail = [[CubeDetailViewController alloc] initVCwithItemType:VCItemTypeShare|VCItemTypeMore withNavTitle:NULL];
    
    [self.navigationController pushViewController:cubeDetail animated:YES];
    
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
