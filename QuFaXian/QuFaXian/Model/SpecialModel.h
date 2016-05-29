//
//  SpecialModel.h
//  QuFaXian
//
//  Created by licong on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialModel : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *contentNum; //讨论数

@property (nonatomic, copy) NSString *title; //专题名

@property (nonatomic, copy) NSString *backImg; //背景图

@property (nonatomic, copy) NSString *nameImg; //背景图上的小图

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
