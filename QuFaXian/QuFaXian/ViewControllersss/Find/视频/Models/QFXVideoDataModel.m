//
//  QFXVideoDataModel.m
//  QuFaXian
//
//  Created by hzy on 16/5/20.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXVideoDataModel.h"

@implementation QFXVideoDataModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
    }
    return self;
}

+ (instancetype)videoDataModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


@end
