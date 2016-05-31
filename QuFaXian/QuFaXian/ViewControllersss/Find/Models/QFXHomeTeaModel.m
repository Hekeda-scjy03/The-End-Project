//
//  QFXHomeTeaModel.m
//  QuFaXian
//
//  Created by hzy on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXHomeTeaModel.h"

@implementation QFXHomeTeaModel

+ (NSMutableArray *)refreshDataModelWithDict:(NSDictionary *)dict
{
    QFXHomeTeaModel *refreshDataModel = [QFXHomeTeaModel mj_objectWithKeyValues:dict];
    
    return refreshDataModel.entity_list;
}


+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"entity_list" : @"QFXEntity_List",
             };
}

@end
