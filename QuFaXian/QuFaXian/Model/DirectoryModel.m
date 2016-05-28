//
//  DirectoryModel.m
//  QuFaXian
//
//  Created by licong on 16/5/27.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "DirectoryModel.h"
#import "TypeNineModel.h"
@implementation DirectoryModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        NSDictionary *meowDic = [dic objectForKey:@"meow"];
        
        self.title = [meowDic objectForKey:@"title"];
        self.id = [meowDic objectForKey:@"id"];
        self.introduce = [meowDic objectForKey:@"intro"];
        
        NSDictionary *thumbDic = [meowDic objectForKey:@"thumb"];
        self.leftImg = [thumbDic objectForKey:@"raw"];
        
        
        NSDictionary *groupDic = [meowDic objectForKey:@"group"];
        self.author = [groupDic objectForKey:@"name"];
        
        self.des = [meowDic objectForKey:@"description"];
        
        self.meowtype = [meowDic objectForKey:@"meow_type"];
        
        
        self.images = [meowDic objectForKey:@"images"];
        NSMutableArray *imagesArray = [[NSMutableArray alloc]init];
        for (NSDictionary *dict in self.images) {
            TypeNineModel *type = [[TypeNineModel alloc]initWithDic:dict];
            [imagesArray addObject:type];
        }
        self.images = imagesArray;
    }
    return self;
}

@end
