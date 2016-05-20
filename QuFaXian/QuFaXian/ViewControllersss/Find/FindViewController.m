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
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface FindViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{
    UICollectionView *_collectionView;
    
    ListBtn *_right,*_left;
}

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initButton];
    [self initCollectionView];
}

#pragma mark - 获取网络数据
- (void)getData{
    NSDictionary *parameterDic = @{@"HTTP-AUTHORIZATION":@"0c596a400bb611e6b2805254006fe942"};
    
    HTTPRequest *request = [HTTPRequest shareInstance];
    [request getURL:@"http://mmmono.com/api/v3/new_explore/?" parameterDic:parameterDic success:^(id responsObj) {
        NSLog(@"111 + %@",responsObj);
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
}

#pragma mark - collection delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}
//item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    FindCubeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cubeCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
 
}

//设置Item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(screenWidth / 2, screenHeight / 3);
}

#pragma mark - 设置footer
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section % 2 ==0) {
        TopicsFooterCollectionReusableView *topicFooter = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"topicFooter" forIndexPath:indexPath];
        return topicFooter;
    }else{
        FooterCollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footerCell" forIndexPath:indexPath];
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
