//
//  CreatorModel.m
//  QuFaXian
//
//  Created by licong on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "CreatorModel.h"
#import <MJExtension.h>
@implementation CreatorModel

//替换属性名
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"creatorDescription":@"description"};
}

MJExtensionCodingImplementation;

@end
