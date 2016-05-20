//
//  CreatorModel.h
//  QuFaXian
//
//  Created by licong on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreatorModel : NSObject

@property (nonatomic, strong) NSString *name;//名字

@property (nonatomic, strong) NSString *category; //#分类名

@property (nonatomic, strong) NSString *creatorDescription; //描述

@property (nonatomic, strong) NSString *iscuss_content_num; //讨论数

@property (nonatomic, strong) NSString *topic_content_num; //内容数

@property (nonatomic, strong) NSString *avatar_url; //头像

@property (nonatomic, strong) NSString *user_id; //id

@end
