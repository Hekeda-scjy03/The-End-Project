//
//  TagModel.m
//  QuFaXian
//
//  Created by licong on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "TagModel.h"

@implementation TagModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.name = [dic objectForKey:@"name"];
        self.id = [dic objectForKey:@"id"];
        
    }
    return self;
}


@end
