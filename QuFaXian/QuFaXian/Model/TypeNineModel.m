//
//  TypeNine.m
//  QuFaXian
//
//  Created by licong on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "TypeNineModel.h"

@implementation TypeNineModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.leftImgFromArray = [dic objectForKey:@"raw"];
    }
    return self;
}

@end
