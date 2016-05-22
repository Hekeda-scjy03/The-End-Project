//
//  CubeDetailModel.m
//  QuFaXian
//
//  Created by licong on 16/5/22.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "CubeDetailModel.h"

@implementation CubeDetailModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        NSDictionary *groupDic = [dic objectForKey:@"group"];
        self.category = [groupDic objectForKey:@"category"];
        self.stateContentNum = [groupDic objectForKey:@"topic_content_num"];
        self.stateContentNum = [groupDic objectForKey:@"discuss_content_num"];
        
        self.cellZanNum = [dic objectForKey:@"bang_count"];
        self.title = [dic objectForKey:@"title"];
        self.des = [dic objectForKey:@"description"];
        self.id = [dic objectForKey:@"id"];
        self.cellCommentNum = [dic objectForKey:@"comment_count"];
        self.meowtype = [dic objectForKey:@"meow_type"];
        self.time = [dic objectForKey:@"create_time"];
        self.kind = [dic objectForKey:@"kind"];
        self.intro= [dic objectForKey:@"intro"];
        self.headImg = [groupDic objectForKey:@"userDic"];

        self.stateName = [groupDic objectForKey:@"name"];
        
        self.joinNum = [groupDic objectForKey:@"member_num"];
        
        
        NSDictionary *thumbDic = [dic objectForKey:@"thumb"];
        self.backgroundImg = [thumbDic objectForKey:@"raw"];

        NSDictionary *userDic = [dic objectForKey:@"user"];
        self.directorHead = [userDic objectForKey:@"avatar_url"];

        self.directorName = [userDic objectForKey:@"name"];
        self.directorDes = [userDic objectForKey:@"self_description"];

    }
    return self;
}

@end
