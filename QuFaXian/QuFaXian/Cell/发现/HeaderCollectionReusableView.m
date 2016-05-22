//
//  HeaderCollectionReusableView.m
//  QuFaXian
//
//  Created by licong on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "HeaderCollectionReusableView.h"
#import "BannerModel.h"
@implementation HeaderCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setBannerList:(NSMutableArray *)bannerList
{
    _bannerList = bannerList;
    
    [self.viewPager setImageAry:bannerList];
}

@end
