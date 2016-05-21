//
//  SpecialModel.h
//  QuFaXian
//
//  Created by licong on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialModel : NSObject

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *contentNum; //讨论数

@property (nonatomic, strong) NSString *title; //专题名

@property (nonatomic, strong) NSString *backImg; //背景图

@property (nonatomic, strong) NSString *nameImg; //背景图上的小图

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
