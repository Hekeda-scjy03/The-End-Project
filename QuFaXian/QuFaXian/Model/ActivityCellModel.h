//
//  ActivityCellModel.h
//  QuFaXian
//
//  Created by licong on 16/5/30.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ActivityCellModel : NSObject

@property (nonatomic, strong) NSArray *meowArray;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *rules;

@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *topImg;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *headImg;

@property (nonatomic, strong) NSNumber *memberNum;

@property (nonatomic, copy) NSString *id;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
