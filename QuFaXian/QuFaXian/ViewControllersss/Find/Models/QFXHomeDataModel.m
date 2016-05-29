//
//  QFXHomeDataModel.m
//  QuFaXian
//
//  Created by hzy on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXHomeDataModel.h"

@implementation QFXHomeDataModel

+ (NSMutableArray *)homeDataModelWithDict:(NSDictionary *)dict
{
    QFXHomeDataModel *homeDataModel = [QFXHomeDataModel mj_objectWithKeyValues:dict];

    return homeDataModel.tea.entity_list;
    
}



@end
