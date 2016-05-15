//
//  ShareButtonViewController.m
//  QuFaXian
//
//  Created by licong on 16/5/15.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ShareButtonViewController.h"
#import "ShareButton.h"
#import "UIColor+HexColor.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface ShareButtonViewController ()

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@end

@implementation ShareButtonViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initShareButton];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"3B3B3B"];
    
    _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapToDismiss)];
    [self.view addGestureRecognizer:_tap];
}


#pragma mark - 点击收回vc
- (void)tapToDismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 弹出的button
- (void)initShareButton{
    NSArray *itemImageNames = @[@"btn-share-friends",@"btn-share-wechat",@"btn-share-qq",@"btn-share-weibo"];
    
    NSArray *texts = @[@"朋友圈",@"微信",@"QQ/空间",@"新浪微博"];
    
    for (int i = 0; i<texts.count; i++) {
        ShareButton *share = [[[NSBundle mainBundle]loadNibNamed:@"ShareButton" owner:nil options:nil] lastObject];
        
        share.btn.tag = i;
        share.buttonLabel.text = texts[i];
        [share setButtonImage:itemImageNames[i] withTitle:texts[i]];
        int width = 50;
        int edge = (screenWidth - 4 * width) / 8;
        float heightTimes = 0.75;
        
        
        if (i == 0) {
            share.frame = CGRectMake(edge, screenHeight * heightTimes + screenHeight, width, width);
        }else if(i == 1){
            share.frame = CGRectMake((i + 2) * edge + width, screenHeight * heightTimes + screenHeight, width, width);
        }else if(i == 2){
            share.frame = CGRectMake((i + 3) * edge + width * 2, screenHeight * heightTimes + screenHeight, width, width);
        }else{
            share.frame = CGRectMake((i + 4) * edge + width * 3, screenHeight * heightTimes + screenHeight, width, width);
        }
        
        [share addTarget:self action:@selector(clickToShare:)];
        
        [UIView animateWithDuration:1 delay:(i + 1) * 0.1 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            CGRect shareFrame = share.frame;
            shareFrame.origin.y -= screenHeight;
            share.frame = shareFrame;
        } completion:^(BOOL finished) {
            
        }];
        
        
        [self.view addSubview:share];
        
    }

}

#pragma mark - 点击分享弹出的button
- (void)clickToShare:(id)sender{
    UIButton *button = (UIButton *)sender;
    
    switch (button.tag) {
        case 0:
            NSLog(@"1");
            break;
            
        case 1:
            NSLog(@"1");
            break;
            
        case 2:
            NSLog(@"1");
            break;
            
        case 3:
            NSLog(@"1");
            break;
    }
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
