//
//  CreatorModel.m
//  QuFaXian
//
//  Created by licong on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "CreatorModel.h"

@implementation CreatorModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        NSDictionary *groupDic = [dic objectForKey:@"group"];
        
        self.name = [groupDic objectForKey:@"name"];
        self.id = [groupDic objectForKey:@"id"];
        self.des = [groupDic objectForKey:@"description"];
        self.topicsNum = [groupDic objectForKey:@"topic_content_num"];
        self.kind = [groupDic objectForKey:@"kind"];
        self.headImg = [groupDic objectForKey:@"logo_url"];
        self.membersNum = [groupDic objectForKey:@"member_num"];
    }
    return self;
}

@end
