//
//  BannerModel.h
//  QuFaXian
//
//  Created by licong on 16/5/22.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannerModel : NSObject

@property (nonatomic, copy) NSString *bannerURL;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
