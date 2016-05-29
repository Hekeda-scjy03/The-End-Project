//
//  TagModel.h
//  QuFaXian
//
//  Created by licong on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagModel : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
