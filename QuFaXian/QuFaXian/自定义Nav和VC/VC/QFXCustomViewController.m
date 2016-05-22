//
//  QFXCustomViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/5.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXCustomViewController.h"
#import "UIBarButtonItem+InitType.h"
#import "UIStoryboard+NavPopToVC.h"
#import "UINavigationController+Pop.h"
#import "SearchViewController.h"
#import "ShareButtonViewController.h"


@interface QFXCustomViewController ()

@end

@implementation QFXCustomViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

//初始化navigationbar
- (instancetype)initVCwithItemType:(ViewControllerItemType)itemType withNavTitle:(NavTitle)navTitle{
    self = [super init];
    if (self) {
        self.itemType = itemType;
        self.navTtle = navTitle;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO]; [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //设置barbuttonitem样式
    switch (self.itemType) {
        case VCItemTypeSearch | VCItemTypeLeftAdd: //搜索图标
            self.navigationItem.leftBarButtonItem = [UIBarButtonItem setWithImageName:@"sousuo" withHighlightedImage:@"sousuo" target:self action:@selector(jumpToSearchVC) title:nil position:UIControlContentHorizontalAlignmentLeft];
            self.navigationItem.rightBarButtonItem = [UIBarButtonItem setWithImageName:@"tianjia" withHighlightedImage:@"tianjia" target:self action:@selector(addButtonMethod) title:nil position:UIControlContentHorizontalAlignmentRight];
            break;
            
        case VCItemTypeShare | VCItemTypeMore: //分享图标
            self.navigationItem.rightBarButtonItems = @[
            [UIBarButtonItem setWithImageName:@"btn-top-more" withHighlightedImage:@"btn-top-more-active" target:self action:@selector(moreMethod) title:nil position:UIControlContentHorizontalAlignmentRight],[UIBarButtonItem setWithImageName:@"icon-share-white-in-nav" withHighlightedImage:@"icon-share-white-in-nav" target:self action:@selector(shareMethod) title:nil position:UIControlContentHorizontalAlignmentRight]];
            break;
            
        default:
            break;
    }
    
    switch (self.navTtle) {
        case TitleFindValue:
            self.navigationItem.title = @"发现";
            break;
            
        case TitleDynamicValue:
            self.navigationItem.title = @"动态";
            break;
            
        case TitleRecommendValue:
            self.navigationItem.title = @"推荐";
            break;
            
        default:
            break;
    }
}

#pragma mark - 跳转到搜索界面
- (void)jumpToSearchVC{
    
    SearchViewController *search = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:search animated:YES];
    
    NSLog(@"搜索");
    
}

#pragma mark - 加号button点击方法
- (void)addButtonMethod{
    NSLog(@"点击了➕");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 分享
- (void)shareMethod{
    ShareButtonViewController *shareVC = [[ShareButtonViewController alloc]init];
    
    [self presentViewController:shareVC animated:YES completion:nil];
    
}

#pragma mark - 更多
- (void)moreMethod{
    
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
