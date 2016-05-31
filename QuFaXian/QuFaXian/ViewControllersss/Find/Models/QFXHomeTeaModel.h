//
//  QFXHomeTeaModel.h
//  QuFaXian
//
//  Created by hzy on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFXEntity_List.h"
#import <MJExtension.h>
@interface QFXHomeTeaModel : NSObject

@property (nonatomic, copy) NSString *start;

@property (nonatomic, strong) NSMutableArray *entity_list;

+ (NSMutableArray *)refreshDataModelWithDict:(NSDictionary *)dict;

@end
