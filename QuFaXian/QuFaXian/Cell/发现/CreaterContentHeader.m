//
//  CreaterContentHeader.m
//  QuFaXian
//
//  Created by licong on 16/5/15.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "CreaterContentHeader.h"
#import <UIImageView+WebCache.h>

@implementation CreaterContentHeader

- (void)awakeFromNib{
    
    self.headerBigHeadImage.layer.cornerRadius = self.headerBigHeadImage.frame.size.width / 2;
    self.headerBigHeadImage.layer.masksToBounds = YES;
//    [self.headerBigHeadImage.image sd_setImageWithURL:];
    
    
    self.stateCreateHeadImg.layer.cornerRadius = self.headerBigHeadImage.frame.size.width / 2;
    self.stateCreateHeadImg.layer.masksToBounds = YES;
//    [self.stateCreateHeadImg.image sd_setImageWithURL:];
    

    [self.discussBtn setImage:[UIImage imageNamed:@"icon-discussion-black"] forState:UIControlStateSelected];
    [self.discussBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [self.contentsBtn setImage:[UIImage imageNamed:@"icon-topic-black"] forState:UIControlStateSelected];
    [self.contentsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    
}

#pragma mark - 内容 讨论button的点击事件
- (IBAction)clickToRefreshList:(id)sender {
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 0:
        {
            if ([self.delegate respondsToSelector:@selector(clickBtnToRefreshList)]) {
                [self.delegate clickBtnToRefreshList];
            }
        }
            break;
            
        case 1:
        {
            
        }
            break;
            
        default:
            break;
    }
    
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
