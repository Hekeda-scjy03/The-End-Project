//
//  SecondGroupinfo.m
//  QuFaXian
//
//  Created by licong on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "SecondGroupinfo.h"

@implementation SecondGroupinfo

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.slogan = [dic objectForKey:@"slogan"];
        self.logo_url = [dic objectForKey:@"logo_url"];
        NSDictionary *tempDic =[dic objectForKey:@"thumb"];
        self.imageURL = [tempDic objectForKey:@"raw"];
        
        
    }
    return self;
}

@end
