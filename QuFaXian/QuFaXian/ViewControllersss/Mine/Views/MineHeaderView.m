//
//  MineHeaderView.m
//  QuFaXian
//
//  Created by hzy on 16/5/20.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "MineHeaderView.h"

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
- (IBAction)personalBtnClick {
}
@end
