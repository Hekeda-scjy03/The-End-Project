//
//  SpecialCellModel.h
//  QuFaXian
//
//  Created by licong on 16/5/30.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialCellModel : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSNumber *contentNum;

@property (nonatomic, copy) NSString *specialTitle;

@property (nonatomic, copy) NSString *backImg;

@property (nonatomic, strong) NSArray *entityList;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
