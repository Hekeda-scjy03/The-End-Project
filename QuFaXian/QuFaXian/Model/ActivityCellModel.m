//
//  ActivityCellModel.m
//  QuFaXian
//
//  Created by licong on 16/5/30.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ActivityCellModel.h"
#import "ActivityEntitylist.h"
@implementation ActivityCellModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        
        self.meowArray = [dic objectForKey:@"meow_list"];
        NSMutableArray *entityArray = [[NSMutableArray alloc]init];
        for (NSDictionary *dict in self.meowArray) {
            
            ActivityEntitylist *listModel = [[ActivityEntitylist alloc] initWithDic:dict];
            [entityArray addObject:listModel];
        }
        self.meowArray = entityArray;
        
        NSDictionary *campaginDic = [dic objectForKey:@"campaign"];
        self.des = [campaginDic objectForKey:@"description"];
        self.title = [campaginDic objectForKey:@"title"];
        self.rules = [campaginDic objectForKey:@"rules"];
        self.memberNum = [campaginDic objectForKey:@"participant_num"];
        self.id = [campaginDic objectForKey:@"id"];
        
        NSDictionary *thumbDic = [campaginDic objectForKey:@"thumb"];
        self.topImg = [thumbDic objectForKey:@"raw"];
        
        NSDictionary *groupDic = [campaginDic objectForKey:@"group_info"];
        self.name = [groupDic objectForKey:@"name"];
        self.headImg = [groupDic objectForKey:@"logo_url"];

    }
    return self;
}

@end
