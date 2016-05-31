//
//  SpecialEntityList.m
//  QuFaXian
//
//  Created by licong on 16/5/30.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "SpecialEntityList.h"

@implementation SpecialEntityList

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        NSDictionary *meowDic = [dic objectForKey:@"meow"];
        self.cellId = [meowDic objectForKey:@"id"];
                
        self.likeNum = [meowDic objectForKey:@"bang_count"];
        self.commentNum = [meowDic objectForKey:@"comment_count"];
        
        self.des = [meowDic objectForKey:@"description"];
        
        self.title = [dic objectForKey:@"title"];
        
        NSDictionary *thumbDic = [meowDic objectForKey:@"thumb"];
        self.cellImg = [thumbDic objectForKey:@"raw"];
        
        
        
        NSDictionary *groupDic = [meowDic objectForKey:@"group"];
        self.category = [groupDic objectForKey:@"category"];
        self.creatorHead = [groupDic objectForKey:@"logo_url"];
        self.creatorName = [groupDic objectForKey:@"name"];
    }
    return self;
}

@end
