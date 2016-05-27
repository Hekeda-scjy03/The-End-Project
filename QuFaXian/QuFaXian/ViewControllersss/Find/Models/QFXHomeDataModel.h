//
//  QFXHomeDataModel.h
//  QuFaXian
//
//  Created by hzy on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

#import "QFXHomeTeaModel.h"

@interface QFXHomeDataModel : NSObject



@property (nonatomic, strong) QFXHomeTeaModel *tea;


+ (NSMutableArray *)homeDataModelWithDict:(NSDictionary *)dict;

@end
