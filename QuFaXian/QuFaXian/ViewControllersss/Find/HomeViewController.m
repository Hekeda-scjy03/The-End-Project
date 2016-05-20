//
//  HomeViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/6.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeaderView.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;


@property (nonatomic, strong) HomeHeaderView *homeHeaderView;

@end

@implementation HomeViewController

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeHeaderView *homeHeaderView = [HomeHeaderView homeHeaderView];
    self.homeTableView.tableHeaderView = homeHeaderView;
    self.homeHeaderView = homeHeaderView;
}


#pragma mark - viewDidAppear
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.homeHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
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
