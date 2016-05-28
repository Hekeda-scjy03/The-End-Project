//
//  DirectoryModel.h
//  QuFaXian
//
//  Created by licong on 16/5/27.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface DirectoryModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *leftImg;

@property (nonatomic, copy) NSString *introduce;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *des;

@property (nonatomic, strong) NSNumber *meowtype;

@property (nonatomic, strong) NSArray *images;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
