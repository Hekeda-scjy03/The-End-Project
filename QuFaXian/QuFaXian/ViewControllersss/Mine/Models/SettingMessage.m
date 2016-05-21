//
//  SettingMessage.m
//  QuFaXian
//
//  Created by hzy on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "SettingMessage.h"

@implementation SettingMessage

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)settingMessageWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
