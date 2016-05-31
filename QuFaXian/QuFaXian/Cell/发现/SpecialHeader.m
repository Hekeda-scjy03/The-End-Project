//
//  SpecialHeader.m
//  QuFaXian
//
//  Created by licong on 16/5/30.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "SpecialHeader.h"
#import "SpecialCellModel.h"
#import <UIImageView+WebCache.h>
@implementation SpecialHeader

- (void)setSpecialModel:(SpecialCellModel *)specialModel{
    
    _specialModel = specialModel;
    
    
    [self.specialHeaderBackImg sd_setImageWithURL:[NSURL URLWithString:specialModel.backImg]];
    
    self.specialHeaderTitle.text = specialModel.specialTitle;
    
    self.specialHeaderContentNum.text = [NSString stringWithFormat:@"共有%@篇内容",specialModel.contentNum];
}

@end
