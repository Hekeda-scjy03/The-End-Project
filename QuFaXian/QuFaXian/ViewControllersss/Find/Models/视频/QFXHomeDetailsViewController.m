//
//  QFXHomeDetailsViewController.m
//  QuFaXian
//
//  Created by hzy on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXHomeDetailsViewController.h"
#import "QFXHomeMeowModel.h"

@interface QFXHomeDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *homeDetailsWebView;

@end

@implementation QFXHomeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 1.URL 定位资源,需要资源的地址
    NSString *str = [NSString stringWithFormat:@"http://mmmono.com/g/meow/%@/",self.dataID];
    
    NSURL *urlStr = [NSURL URLWithString:str];
    
    // 2.请求，把 URL 告诉服务器，从 m.baidu.com 请求数据
    NSURLRequest *request = [NSURLRequest requestWithURL:urlStr];
    
    // 3.发送请求给服务器
    [self.homeDetailsWebView loadRequest:request];

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
