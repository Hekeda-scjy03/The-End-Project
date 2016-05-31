//
//  SpecialEntityList.h
//  QuFaXian
//
//  Created by licong on 16/5/30.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialEntityList : NSObject

@property (nonatomic, copy) NSNumber *likeNum;

@property (nonatomic, copy) NSNumber *commentNum;

@property (nonatomic, copy) NSString *cellImg;

@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *cellId;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *creatorName;

@property (nonatomic, copy) NSString *creatorHead;

@property (nonatomic, copy) NSString *category;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
