//
//  MeowsModel.m
//  QuFaXian
//
//  Created by hzy on 16/5/26.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXVideoMeowsModel.h"

@implementation QFXVideoMeowsModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"ID" : @"id",
             @"desc" : @"description",
             };
}

@end
