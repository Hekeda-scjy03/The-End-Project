//
//  CubeModel.h
//  QuFaXian
//
//  Created by licong on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CubeModel : NSObject

@property (nonatomic, copy) NSString *category; //分类

@property (nonatomic, copy) NSString *des; //简介

@property (nonatomic, copy) NSString *name; //名字

@property (nonatomic, copy) NSString *kind; //传过来的kind 和接口地址有关

@property (nonatomic, copy) NSString *cubeImage;//cell显示的图片

@property (nonatomic, copy) NSString *topicNum;//点进去之后返回的cell数 也就是内容数量

@property (nonatomic, copy) NSString *id; //id

@property (nonatomic, copy) NSString *discussNum; //讨论数

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
