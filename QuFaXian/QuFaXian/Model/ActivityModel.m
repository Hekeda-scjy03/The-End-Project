//
//  FirstModel.m
//  QuFaXian
//
//  Created by licong on 16/5/20.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
       
        self.activityId = [dic objectForKey:@"id"];
        self.title = [dic objectForKey:@"title"];

        self.des = [dic objectForKey:@"description"];
        self.participationNum = [dic objectForKey:@"participant_num"];
        NSDictionary *thumbDic = [dic objectForKey:@"thumb"];
        self.backImage = [thumbDic objectForKey:@"raw"];
        

        
    }
    return self;
}

@end
