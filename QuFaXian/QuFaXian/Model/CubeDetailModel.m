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
        NSDictionary *categoryDic = [dic objectForKey:@"category"];
        self.category = [categoryDic objectForKey:@"name"];
       
        self.title = [dic objectForKey:@"title"];
        
        self.likeNum = [dic objectForKey:@"bang_count"];
        self.commentNum = [dic objectForKey:@"comment_count"];
        self.meowtype = [dic objectForKey:@"meow_type"];
        self.time = [dic objectForKey:@"create_time"];
        self.kind = [dic objectForKey:@"kind"];
        self.intro= [dic objectForKey:@"intro"];
        self.des = [dic objectForKey:@"description"];
        self.cellId = [dic objectForKey:@"id"];
        
        NSDictionary *thumbDic = [dic objectForKey:@"thumb"];
        self.backImg = [thumbDic objectForKey:@"raw"];
        
        
        
        self.cellText = [dic objectForKey:@"text"];
        NSDictionary *userDic = [dic objectForKey:@"user"];
        self.senderHeadImg = [userDic objectForKey:@"avatar_url"];
        self.senderName = [userDic objectForKey:@"name"];
        self.senderDes = [userDic objectForKey:@"self_description"];
    }
    return self;
}

@end
