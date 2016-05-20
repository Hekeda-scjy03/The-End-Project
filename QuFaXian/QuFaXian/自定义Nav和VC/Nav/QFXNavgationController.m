//
//  QFXNavGationController.m
//  QuFaXian
//
//  Created by licong on 16/5/10.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXNavgationController.h"

@interface QFXNavgationController ()

@end

@implementation QFXNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //push之后 返回只有一个箭头
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake([UIScreen mainScreen].bounds.size.width, 0) forBarMetrics:UIBarMetricsDefault];
    
    
    if (self.viewControllers.count > 0) {
        [self.navigationBar setTintColor:[UIColor blackColor]];
        [[UINavigationBar appearance]setBarTintColor:[UIColor whiteColor]];
        
        [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:15]}];
        
    }else{
        [self.navigationBar setTintColor:[UIColor whiteColor]];//箭头白色
        [[UINavigationBar appearance]setBarTintColor:[UIColor blackColor]];
        
        [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    }
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    /**
     跳转下一vc时隐藏tabbar
     */
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:YES];
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
