//
//  TypeTwoCollectionReusableView.m
//  QuFaXian
//
//  Created by licong on 16/5/22.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "TypeTwoCollectionReusableView.h"
#import <UIImageView+WebCache.h>
#import "CubeDetailModel.h"
@implementation TypeTwoCollectionReusableView

- (void)setCubeDetail:(CubeDetailModel *)cubeDetail{
    _cubeDetail = cubeDetail;
    [self.headImage.imageView sd_setImageWithURL:[NSURL URLWithString:cubeDetail.headImg]];
    
    self.time.text = cubeDetail.time;
    
//    self.texts = cubeDetail.
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
