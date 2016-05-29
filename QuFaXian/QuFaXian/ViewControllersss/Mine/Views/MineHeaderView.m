//
//  MineHeaderView.m
//  QuFaXian
//
//  Created by hzy on 16/5/20.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "MineHeaderView.h"
#import "QFXPersonalDataViewController.h"

@interface MineHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
- (IBAction)iconBtnClick;
@property (weak, nonatomic) IBOutlet UIButton *setBtn;
- (IBAction)setBtnClick;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginBtnClick;
@property (weak, nonatomic) IBOutlet UIButton *personalBtn;
- (IBAction)personalBtnClick;

@end

@implementation MineHeaderView

+ (instancetype)mineHeaderView
{
    MineHeaderView *mineHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"MineHeaderView" owner:nil options:nil] lastObject];
    return mineHeaderView;
}

- (IBAction)iconBtnClick {
}

- (IBAction)setBtnClick {
}
- (IBAction)loginBtnClick {
}

// 个人资料按钮单击事件
- (IBAction)personalBtnClick {
    QFXPersonalDataViewController *targetVC = [[QFXPersonalDataViewController alloc] init];
    [[self getSupVC].navigationController pushViewController:targetVC animated:YES];
    
}
#pragma mark - 获取其父控件所在控制器
- (UIViewController*)getSupVC {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
@end
