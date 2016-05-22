//
//  CubeDetailModel.h
//  QuFaXian
//
//  Created by licong on 16/5/22.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CubeDetailModel : NSObject

@property (nonatomic, strong) NSString *category;

@property (nonatomic, strong) NSString *stateContentNum;//站的内容数

@property (nonatomic, strong) NSString *stateDiscussNum;//站的讨论数

@property (nonatomic, strong) NSString *cellZanNum;//cell内容的赞

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *des;

@property (nonatomic, strong) NSString *intro;

@property (nonatomic, strong) NSString *meowtype;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *cellCommentNum;//cell内容的评论数

@property (nonatomic, strong) NSString *time;

@property (nonatomic, strong) NSString *kind;

@property (nonatomic, strong) NSString *headImg; //内容站的头像

@property (nonatomic, strong) NSString *backgroundImg; //内容站的背景

@property (nonatomic, strong) NSString *stateName; //内容站的名字

@property (nonatomic, strong) NSString *directorName;//站长名

@property (nonatomic, strong) NSString *directorHead;//站长头像

@property (nonatomic, strong) NSString *directorDes;//站长说明

@property (nonatomic, strong) NSString *joinNum;//关注人数

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
