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

@property (nonatomic, strong) NSNumber *likeNum;//cell内容的赞

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *meowtype;

@property (nonatomic, copy) NSString *cellId;

@property (nonatomic, strong) NSNumber *commentNum;//cell内容的评论数

@property (nonatomic, strong) NSNumber *time;

@property (nonatomic, copy) NSNumber *kind;

@property (nonatomic, copy) NSString *backImg;



//memow = 3时
@property (nonatomic, copy) NSString *cellText;

@property (nonatomic, copy) NSString *senderHeadImg;

@property (nonatomic, copy) NSString *senderName;

@property (nonatomic, copy) NSString *senderDes;


- (instancetype)initWithDic:(NSDictionary *)dic;

@end
