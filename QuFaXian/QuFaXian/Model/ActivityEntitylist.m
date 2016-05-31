//
//  ActivityEntitylist.m
//  QuFaXian
//
//  Created by licong on 16/5/31.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ActivityEntitylist.h"

@implementation ActivityEntitylist

- (instancetype)initWithDic:(NSDictionary* )dic
{
    self = [super init];
    if (self) {
        self.zan = [dic objectForKey:@"bang_count"];
        self.comment = [dic objectForKey:@"comment_count"];
        self.context = [dic objectForKey:@"text"];
        self.title = [dic objectForKey:@"title"];
        
        NSDictionary *userDic = [dic objectForKey:@"user"];
        self.senderDes = [userDic objectForKey:@"name"];
        self.senderName = [userDic objectForKey:@"self_description"];

    }
    return self;
}
@end
