//
//  DirectoryModel.h
//  QuFaXian
//
//  Created by licong on 16/5/27.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DirectoryModel : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *leftImg;

@property (nonatomic, strong) NSString *introduce;

@property (nonatomic, strong) NSString *author;

@property (nonatomic, strong) NSString *id;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
