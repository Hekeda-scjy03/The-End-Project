//
//  BannerModel.m
//  QuFaXian
//
//  Created by licong on 16/5/22.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "BannerModel.h"

@implementation BannerModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.bannerURL = [dic objectForKey:@"banner_img_url"];
    }
    return self;
}

@end
