//
//  QFXMeowModel.m
//  QuFaXian
//
//  Created by hzy on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXHomeMeowModel.h"

@implementation QFXHomeMeowModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"ID" : @"id",
             @"desc" : @"description",
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"pics" : @"QFXHomePicsModel",
             @"images":@"QFXHomeImages"
             };
}

@end
