//
//  QFXVideoDataModel.m
//  QuFaXian
//
//  Created by hzy on 16/5/26.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXVideoDataModel.h"


@implementation QFXVideoDataModel

+ (NSMutableArray *)videoDataModelWithDict:(NSDictionary *)dict
{
    QFXVideoDataModel *videoDataModel = [QFXVideoDataModel mj_objectWithKeyValues:dict];
    
    return videoDataModel.meows;
    
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"meows" : @"QFXVideoMeowsModel",
             };
}


@end
