//
//  HTTPRequest.h
//  QuFaXian
//
//  Created by licong on 16/5/19.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPRequest : NSObject

+ (HTTPRequest *)shareInstance;

- (void)getURL:(NSString *)url parameterDic:(NSDictionary *)dic headerValue:(NSString *)headerValue success:(void(^)(id responsObj))success fail:(void(^)(NSError *error))fail;

- (void)postURL:(NSString *)url parameterDic:(NSDictionary *)dic success:(void(^)(id responsObj))success fail:(void(^)(NSError *error))fail;

@end
