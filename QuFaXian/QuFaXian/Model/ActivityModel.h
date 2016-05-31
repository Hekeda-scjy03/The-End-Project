//
//  FirstModel.h
//  QuFaXian
//
//  Created by licong on 16/5/20.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityModel : NSObject

@property (nonatomic, copy) NSString *activityId;

@property (nonatomic, copy) NSString *des; //线上活动的描述

@property (nonatomic, copy) NSString *title; //线上活动的title

@property (nonatomic, copy) NSString *participationNum;//参加人数

@property (nonatomic, copy) NSString *backImage;//背景图

@property (nonatomic, strong) NSArray *recent_participant_info; //点进去之后下面的参与讨论的



- (instancetype)initWithDic:(NSDictionary *)dic;

@end
