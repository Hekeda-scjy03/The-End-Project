//
//  CubeModel.m
//  QuFaXian
//
//  Created by licong on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "CubeModel.h"

@implementation CubeModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        NSDictionary *groupDic = [dic objectForKey:@"group"];
        self.name = [groupDic objectForKey:@"name"];
        self.stateId = [groupDic objectForKey:@"id"];
        self.kind = [groupDic objectForKey:@"kind"];
        self.des = [groupDic objectForKey:@"description"];
        self.category = [groupDic objectForKey:@"category"];
        self.cubeImage = [groupDic objectForKey:@"logo_url"];
        self.discussNum = [groupDic objectForKey:@"discuss_content_num"];
        self.topicNum = [groupDic objectForKey:@"topic_content_num"];
        
        self.memberNum = [groupDic objectForKey:@"member_num"];
        
        NSDictionary *thumbDic = [groupDic objectForKey:@"thumb"];
        self.topBackImg = [thumbDic objectForKey:@"raw"];
        
        NSDictionary *masterDic = [groupDic objectForKey:@"master_info"];
        self.matserDes = [masterDic objectForKey:@"self_description"];
        self.masterName = [masterDic objectForKey:@"name"];
        self.masterHeadImg = [masterDic objectForKey:@"avatar_url"];
        

    }
    return self;
}

@end
