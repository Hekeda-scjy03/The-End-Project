//
//  SpecialCellModel.m
//  QuFaXian
//
//  Created by licong on 16/5/30.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "SpecialCellModel.h"
#import "SpecialEntityList.h"
@implementation SpecialCellModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        
        NSDictionary *thumbDic = [dic objectForKey:@"thumb"];
        self.backImg = [thumbDic objectForKey:@"raw"];
        
        self.contentNum = [dic objectForKey:@"content_num"];
        
        self.specialTitle = [dic objectForKey:@"title"];
        
        self.id = [dic objectForKey:@"id"];
        
        self.entityList = [dic objectForKey:@"entity_list"];
        
        NSMutableArray *entityArray = [[NSMutableArray alloc]init];
        for (NSDictionary *dict in self.entityList) {

            SpecialEntityList *listModel = [[SpecialEntityList alloc] initWithDic:dict];
            [entityArray addObject:listModel];
        }
        self.entityList = entityArray;
        
    }
    return self;
}

@end
