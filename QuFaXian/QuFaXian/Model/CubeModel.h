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

@property (nonatomic, copy) NSNumber *topicNum;//点进去之后返回的cell数 也就是内容数量

@property (nonatomic, copy) NSString *stateId; //id

@property (nonatomic, copy) NSNumber *discussNum; //讨论数

@property (nonatomic, copy) NSString *topBackImg;

@property (nonatomic, strong) NSNumber *memberNum;

@property (nonatomic, copy) NSString *masterName;//站长名

@property (nonatomic, copy) NSString *masterHeadImg;//站长名

@property (nonatomic, copy) NSString *matserDes;//站长名

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
