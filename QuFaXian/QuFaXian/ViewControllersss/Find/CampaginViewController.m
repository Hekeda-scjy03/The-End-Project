//
//  CampaginViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/30.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "CampaginViewController.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface CampaginViewController ()

@property (strong, nonatomic) UIWebView *webView;

@end

@implementation CampaginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mmmono.com/api/v3/campaign/%@/content/?",self.selectedCellId]]];
    
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
    
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
