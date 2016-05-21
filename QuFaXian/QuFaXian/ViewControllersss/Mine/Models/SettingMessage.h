//
//  SettingMessage.h
//  QuFaXian
//
//  Created by hzy on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingMessage : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *titleImage;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)settingMessageWithDict:(NSDictionary *)dict;

@end
