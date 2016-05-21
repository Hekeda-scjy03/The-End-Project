//
//  SpecialModel.m
//  QuFaXian
//
//  Created by licong on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "SpecialModel.h"

@implementation SpecialModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        NSDictionary *temp = [dic objectForKey:@"collection"];
        self.contentNum = [temp objectForKey:@"content_num"];
        self.title = [temp objectForKey:@"title"];
        self.id = [temp objectForKey:@"id"];
        
        NSDictionary *tempDic = [temp objectForKey:@"thumb"];
        self.backImg = [tempDic objectForKey:@"raw"];
        
        self.nameImg = [temp objectForKey:@"logo_url"];
        
    }
    return self;
}

@end
