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
#import "ShareButton.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

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
        case VCItemTypeSearch: //搜索图标
            self.navigationItem.leftBarButtonItem = [UIBarButtonItem setWithImageName:@"" withHighlightedImage:@"" target:self action:@selector(jumpToSearchVC) title:nil position:UIControlContentHorizontalAlignmentLeft];
            break;
            
        case VCItemTypeLeftAdd://➕图标
            self.navigationItem.rightBarButtonItem = [UIBarButtonItem setWithImageName:@"" withHighlightedImage:@"" target:self action:@selector(addButtonMethod) title:nil position:UIControlContentHorizontalAlignmentRight];
            break;
            
        case VCItemTypeShare | VCItemTypeMore: //分享图标
            self.navigationItem.rightBarButtonItem = [UIBarButtonItem setWithImageName:@"" withHighlightedImage:@"" target:self action:@selector(shareMethod) title:nil position:UIControlContentHorizontalAlignmentRight],
        
            self.navigationItem.rightBarButtonItem = [UIBarButtonItem setWithImageName:@"" withHighlightedImage:@"" target:self action:@selector(moreMethod) title:nil position:UIControlContentHorizontalAlignmentRight];
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
    NSArray *itemImageNames = @[@"btn-share-weibo",@"btn-share-friends",@"btn-share-qq"];
    
    NSArray *texts = @[@"新浪微博",@"朋友圈",@"QQ"];
    
    for (int i = 0; i<texts.count; i++) {
        ShareButton *share = [[[NSBundle mainBundle]loadNibNamed:@"ShareButton" owner:nil options:nil] lastObject];
        
        share.btn.tag = i;
        
        [share setButtonImage:itemImageNames[i] withTitle:texts[i]];
        int width = 50;
        int edge = (screenWidth - 3 * width) / 6;
        
        
        if (i == 0) {
            share.frame = CGRectMake(edge + width, screenHeight * 0.75 + screenHeight, width, width);
        }else if(i == 1){
            share.frame = CGRectMake((i + 2) * edge + width, screenHeight * 0.75 + screenHeight, width, width);
        }else{
            share.frame = CGRectMake((i + 3) * edge + width, screenHeight * 0.75 + screenHeight, width, width);
        }
        
        [share addTarget:self action:@selector(clickButtonItem:)];
        
        [UIView animateWithDuration:1 delay:(i + 1) * 0.1 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            share.frame = CGRectMake(share.frame.origin.x, - share.frame.origin.y - screenHeight, share.frame.size.width, share.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
        
        
        [self.view addSubview:share];
        
    }
    
}

#pragma mark - 点击分享弹出的button
- (void)clickButtonItem:(id)sender{
    UIButton *button = (UIButton *)sender;
    
    switch (button.tag) {
        case 0:
            
            break;
            
        case 1:
            
            break;
            
        case 2:
            
            break;

    }
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
