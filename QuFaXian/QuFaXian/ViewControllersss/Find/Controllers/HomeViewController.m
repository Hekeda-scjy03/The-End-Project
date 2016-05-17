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
//<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *homeTableView;

@property (nonatomic, strong) HomeHeaderView *homeHeaderView;
@end

@implementation HomeViewController

#pragma mark - viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.homeTableView.delegate = self;
//    self.homeTableView.dataSource = self;
    
    HomeHeaderView *homeHeaderView = [HomeHeaderView homeHeaderView];
    self.homeTableView.tableHeaderView = homeHeaderView;
    self.homeHeaderView = homeHeaderView;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.homeHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
}


#pragma mark - UITableViewDataSource
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}


#pragma mark - UITableViewDelegate








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
