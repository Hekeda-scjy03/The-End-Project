//
//  QFXPersonalDataViewController.m
//  QuFaXian
//
//  Created by hzy on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXPersonalDataViewController.h"

@interface QFXPersonalDataViewController ()
@property (weak, nonatomic) IBOutlet UITableView *personalDataTableView;

@end

@implementation QFXPersonalDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"完善个人资料";
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
