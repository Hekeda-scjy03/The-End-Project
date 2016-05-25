//
//  CreatorModel.h
//  QuFaXian
//
//  Created by licong on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreatorModel : NSObject

@property (nonatomic, strong) NSString *name;//名字

@property (nonatomic, strong) NSString *kind;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *des; //描述

@property (nonatomic, strong) NSNumber *membersNum; //讨论数

@property (nonatomic, strong) NSNumber *topicsNum; //内容数

@property (nonatomic, strong) NSString *headImg; //头像

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
