//
//  TopicsFooterCollectionReusableView.m
//  QuFaXian
//
//  Created by licong on 16/5/14.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "TopicsFooterCollectionReusableView.h"
#import <UIImageView+WebCache.h>

@implementation TopicsFooterCollectionReusableView

-(void)setSpecialModel:(SpecialModel *)specialModel{
    _specialModel = specialModel;
    [self.topicImage sd_setImageWithURL:[NSURL URLWithString:specialModel.backImg]];
    NSLog(@"%@",specialModel.backImg);
    self.specialTitle.text = specialModel.title;
    self.contentNum.text = [NSString stringWithFormat:@"共%@篇",specialModel.contentNum];
    [self.specialNameImage sd_setImageWithURL:[NSURL URLWithString:specialModel.nameImg]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
