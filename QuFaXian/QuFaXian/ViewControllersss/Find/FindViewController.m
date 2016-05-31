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
#import "UIColor+HexColor.h"
#import "CreatorListViewController.h"
#import "DirectoryListViewController.h"
#import "HTTPRequest.h"
#import "CubeModel.h"
#import "SpecialModel.h"
#import "ActivityModel.h"
#import <MJRefresh.h>
#import "HeaderCollectionReusableView.h"
#import "BannerModel.h"
#import "CubeDetailModel.h"
#import "CreatorListViewController.h"
#import "DirectoryListViewController.h"
#import "CampaginViewController.h"
#import "CollectionViewController.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface FindViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{
    
    NSMutableArray *_array, *_bannerArray, *_cubeDetailArray;
}
@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) CubeDetailViewController *cubeDetailVC;

@property (strong, nonatomic) CubeModel *cubeModel;

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@property (strong, nonatomic) SpecialModel *specialModel;

@property (strong, nonatomic) ActivityModel *activityModel;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _array = [[NSMutableArray alloc]init];
    _bannerArray = [[NSMutableArray alloc]init];
    _cubeDetailArray = [[NSMutableArray alloc]init];
   
    
    [self initCollectionView];
    [self getData];
    
}

#pragma mark - 获取网络数据
- (void)getData{
    NSString *urlStr = @"";
    //获取一次数据 4个（cell 线上活动footer cell 专题footer）
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
     
        /**
         *  只有第一次获取的数据里有top bannner
         */
        if (_array.count == 0) {
            NSDictionary *topbannerDic = [responsObj objectForKey:@"top_banner"];
            NSArray *entitylist = [topbannerDic objectForKey:@"entity_list"];
                for (NSDictionary *dict in entitylist) {
                    NSString *image = [dict objectForKey:@"banner_img_url"];
                    [_bannerArray addObject:image];
                }
        }
        
        //先解析最外层的字典
        NSArray *modlist = [responsObj objectForKey:@"mod_list"];
        for (int i=0; i<modlist.count; i++) {
            NSDictionary *tempDic = modlist[i];
            
            //解析entity_list字典 因为每一小块都有这个属性
            NSArray *entitylist = [tempDic objectForKey:@"entity_list"];
            
            //cube cell的数据 每一组的第一个和第3个
            if (i % 2 == 0) {
                NSMutableArray *cellArray = [[NSMutableArray alloc]init];
                for (NSDictionary *dic in entitylist) {
                    
                    _cubeModel = [[CubeModel alloc]initWithDic:dic];
                    [cellArray addObject:_cubeModel];
                    
                }
                [_array addObject:cellArray];
            }
            //线上活动footer 返回数据每组的第2个 依次类推就是 1，5，9...
                else if (i % 4 == 1){
                NSDictionary *dataDict = entitylist [0];
                NSDictionary *initDcit = nil;
                    
                //因为第一组和其他的数据优点不一样 所以解析的不一样
                if (_array.count == 1) {
                    NSDictionary *tempDic1 = [dataDict objectForKey:@"meow"];
                    initDcit = [tempDic1 objectForKey:@"ref_campaign"];
                }else{
                    initDcit = [dataDict objectForKey:@"campaign"];
                }
                _activityModel = [[ActivityModel alloc]initWithDic:initDcit];
                [_array addObject:_activityModel];
                
            }
            
            //专题footer 返回数据每组的最后一个 也就是第4个
                else{
                _specialModel = [[SpecialModel alloc]initWithDic:entitylist[0]];
                [_array addObject:_specialModel];
            }
        }
        
        
        
        [_collectionView.mj_footer endRefreshing];
        [_collectionView reloadData];
    } fail:^(NSError *error) {

    }];
    
}

#pragma mark - btn 点击事件 （目录 造物主列表）
- (void)getDirectoryList{
//    [self getData];
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
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight - 49) collectionViewLayout:layout];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_collectionView];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"FindCubeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cubeCell"];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"FooterCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerCell"];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"TopicsFooterCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"topicFooter"];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"HeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    __weak typeof(self) mySelf = self;
   
    if (_array.count != 20) {
        self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            
            [mySelf getData];
        }];
    }
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_array removeAllObjects];
        [_collectionView.mj_header endRefreshing];

        [mySelf getData];
    }];
    
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
    return CGSizeMake(screenWidth / 2, screenHeight / 3 - 30);
}



#pragma mark - 设置footer
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (kind == UICollectionElementKindSectionHeader && indexPath.section == 0) {
            HeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        __weak typeof(self) myself = self;
        header.headerBtnClickBlock = ^(NSInteger tag){
            
            
            
            switch (tag) {
                case 0:
                {
                    DirectoryListViewController *directoryVC = [[DirectoryListViewController alloc]init];
                    [myself.navigationController pushViewController:directoryVC animated:YES];
                }
                    break;
                    
                case 1:
                {
                    CreatorListViewController *creatoVC = [[CreatorListViewController alloc] init];
                    [myself.navigationController pushViewController:creatoVC animated:YES];
                }
                    break;
                default:
                    break;
            }

        };
        header.bannerList = _bannerArray;
            return header;

    }else{
    
        
        
    if (indexPath.section % 2 !=0) {
        TopicsFooterCollectionReusableView *topicFooter = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"topicFooter" forIndexPath:indexPath];
            topicFooter.specialModel = _array[indexPath.section * 2 + 1];
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpToCollectionVC)];
        [topicFooter addGestureRecognizer:_tap];
        return topicFooter;
    }else{
        FooterCollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footerCell" forIndexPath:indexPath];
            footer.activityModel = _array[indexPath.section * 2 + 1];
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpToCampaginVC)];
        [footer addGestureRecognizer:_tap];
        return footer;
    }
    }
}

#pragma mark - 活动VC
- (void)jumpToCampaginVC{
    
    CampaginViewController *campaginVC = [[CampaginViewController alloc]init];
    
    campaginVC.selectedCellId = _activityModel.activityId;
    
    [self.navigationController pushViewController:campaginVC animated:YES];
}

#pragma mark - 专题VC
- (void)jumpToCollectionVC{
    CollectionViewController *collectionVC = [[CollectionViewController alloc]init];
    
    collectionVC.selectedCellId = _specialModel.specialId;

    [self.navigationController pushViewController:collectionVC animated:YES];
}

#pragma mark - 设置header大小 只有第一组返回header
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(screenWidth, 220);

    }
    return CGSizeMake(0, 0);
}

//设置footer大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section % 2 !=0){
        return CGSizeMake(screenWidth, 200);
    }
    return CGSizeMake(screenWidth, 160);
}

#pragma mark - 点击collectionview
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    _cubeDetailVC = [[CubeDetailViewController alloc] initVCwithItemType:VCItemTypeShare|VCItemTypeMore withNavTitle:0];

    NSArray *tempArray = _array[indexPath.section * 2];
    
    _cubeDetailVC.cubeModel = tempArray[indexPath.row];
    
    [self.navigationController pushViewController:_cubeDetailVC animated:YES];
    
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
