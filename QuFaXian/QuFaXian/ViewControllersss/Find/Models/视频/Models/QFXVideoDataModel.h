//
//  QFXVideoDataModel.h
//  QuFaXian
//
//  Created by hzy on 16/5/26.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFXMeowsModel.h"
#import <MJExtension.h>

@interface QFXVideoDataModel : NSObject

@property (nonatomic, strong) NSMutableArray *meows;

+ (NSMutableArray *)videoDataModelWithDict:(NSDictionary *)dict;

@end
