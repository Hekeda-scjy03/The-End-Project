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
        NSDictionary *tempDic = [dic objectForKey:@"group"];
        self.name = [tempDic objectForKey:@"name"];
        self.id = [tempDic objectForKey:@"id"];
        self.des = [tempDic objectForKey:@"description"];
        self.category = [tempDic objectForKey:@"category"];
        self.cubeImage = [tempDic objectForKey:@"logo_url"];
//        self.topBacjImg = [dic objectForKey:@"dsfs"];
        self.discussNum = [tempDic objectForKey:@"discuss_content_num"];
        self.topicNum = [tempDic objectForKey:@"topic_content_num"];
    }
    return self;
}

@end
