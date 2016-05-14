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
    
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];//箭头白色
    [[UINavigationBar appearance]setBarTintColor:[UIColor blackColor]];
    
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    
    
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
