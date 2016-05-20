//
//  QFXTabBarController.m
//  QuFaXian
//
//  Created by licong on 16/5/6.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXTabBarController.h"
#import "MineViewController.h"
#import "DynamicViewController.h"
#import "FindViewController.h"
#import "HomeViewController.h"
#import "QFXTabBar.h"
#import "QFXNavgationController.h"
#import "UIColor+HexColor.h"
@interface QFXTabBarController (){
    NSArray *_titles, *_images, *_selectedImgs;
}

@end

@implementation QFXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  设置item默认状态下和被选中时的文字颜色
     */
    NSDictionary *selectedAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:20.f], NSForegroundColorAttributeName:[UIColor colorWithHexString:@"45AE8B"]};//被选中时的文字大小和颜色
    NSDictionary *normalAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"616161"]};//默认的颜色
    UITabBarItem *item = [UITabBarItem appearance];
    
    [item setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
    [item setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    
    [self tabbarInitWithVC:[[HomeViewController alloc] initVCwithItemType:nil withNavTitle:TitleRecommendValue] image:@"" highlightedImageName:@"" title:@"推荐"];
    
    [self tabbarInitWithVC:[[FindViewController alloc] initVCwithItemType:VCItemTypeSearch withNavTitle:TitleFindValue] image:@"" highlightedImageName:@"" title:@"发现"];
    [self tabbarInitWithVC:[[DynamicViewController alloc] initVCwithItemType:nil withNavTitle:TitleDynamicValue] image:@"" highlightedImageName:@"" title:@"动态"];
    [self tabbarInitWithVC:[[MineViewController alloc] initVCwithItemType:nil withNavTitle:nil] image:@"" highlightedImageName:@"" title:@"我的"];
    
    [self setValue:[[QFXTabBar alloc] init] forKey:@"tabBar"];
    
}

#pragma mark - 添加tabbar上的vc
- (void)tabbarInitWithVC:(UIViewController *)vc image:(NSString *)imageName highlightedImageName:(NSString *)highlightedName title:(NSString *)title{
    vc.title = title;
    
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:highlightedName];
    
    QFXNavgationController *nav = [[QFXNavgationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:nav];
    
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
