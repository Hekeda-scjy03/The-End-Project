//
//  CubeDetailModel.h
//  QuFaXian
//
//  Created by licong on 16/5/22.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CubeDetailModel : NSObject

@property (nonatomic, copy) NSString *category;

@property (nonatomic, strong) NSNumber *stateContentNum;//站的内容数

@property (nonatomic, strong) NSNumber *stateDiscussNum;//站的讨论数

@property (nonatomic, strong) NSNumber *cellZanNum;//cell内容的赞

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *meowtype;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, strong) NSNumber *cellCommentNum;//cell内容的评论数

@property (nonatomic, strong) NSNumber *time;

@property (nonatomic, copy) NSString *kind;

@property (nonatomic, copy) NSString *headImg; //内容站的头像

@property (nonatomic, copy) NSString *backgroundImg; //内容站的背景

@property (nonatomic, copy) NSString *stateName; //内容站的名字

@property (nonatomic, copy) NSString *directorName;//站长名

@property (nonatomic, copy) NSString *directorHead;//站长头像

@property (nonatomic, copy) NSString *directorDes;//站长说明

@property (nonatomic, copy) NSString *joinNum;//关注人数

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
