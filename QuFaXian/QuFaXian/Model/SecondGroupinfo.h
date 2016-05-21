//
//  SecondGroupinfo.h
//  QuFaXian
//
//  Created by licong on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecondGroupinfo : NSObject

@property (nonatomic, strong) NSString *slogan; //口号

@property (nonatomic, strong) NSString *logo_url; //站的头像

@property (nonatomic, strong) NSString *imageURL; //上面的背景图

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
