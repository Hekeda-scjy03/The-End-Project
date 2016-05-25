//
//  CubeModel.h
//  QuFaXian
//
//  Created by licong on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CubeModel : NSObject

@property (nonatomic, strong) NSString *category; //分类

@property (nonatomic, strong) NSString *des; //简介

@property (nonatomic, strong) NSString *name; //名字

@property (nonatomic, strong) NSString *kind; //传过来的kind 和接口地址有关

@property (nonatomic, strong) NSString *cubeImage;//cell显示的图片

@property (nonatomic, strong) NSString *topicNum;//点进去之后返回的cell数 也就是内容数量

@property (nonatomic, strong) NSString *id; //id

@property (nonatomic, strong) NSString *discussNum; //讨论数

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
