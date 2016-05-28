//
//  DirectoryListDeatilViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "DirectoryListDeatilViewController.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height


@interface DirectoryListDeatilViewController (){
    
}

@property (strong, nonatomic) UIWebView *webView;

@end

@implementation DirectoryListDeatilViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mmmono.com/g/meow/%@/",self.selectedCellId]]];
    
    [_webView loadRequest:request];
    [self.view addSubview:_webView];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
