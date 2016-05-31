//
//  ActivityEntitylist.h
//  QuFaXian
//
//  Created by licong on 16/5/31.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityEntitylist : NSObject

@property (nonatomic, strong) NSNumber *zan;

@property (nonatomic, strong) NSNumber *comment;

@property (nonatomic, copy) NSString *context;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *senderName;

@property (nonatomic, copy) NSString *senderDes;

- (instancetype)initWithDic:(NSDictionary* )dic;

@end
