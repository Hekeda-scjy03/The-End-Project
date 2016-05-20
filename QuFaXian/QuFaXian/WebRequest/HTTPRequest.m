//
//  HTTPRequest.m
//  QuFaXian
//
//  Created by licong on 16/5/19.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "HTTPRequest.h"
#import <AFNetworking.h>
@implementation HTTPRequest

static HTTPRequest *httpRequest = nil;
+ (HTTPRequest *)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpRequest == nil) {
            httpRequest = [[self alloc]init];
        }
    });
    return httpRequest;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpRequest == nil) {
            httpRequest = [super allocWithZone:zone];
        }
    });
    return httpRequest;
}

- (void)getURL:(NSString *)url parameterDic:(NSDictionary *)dic success:(void(^)(id responsObj)) success fail:(void(^)(NSError *error))fail{
    
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //请求的结果是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //类型不一致替换一致xx类别的
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"xx", nil];
    
    [manager GET:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
    
    

}

- (void)postURL:(NSString *)url parameterDic:(NSDictionary *)dic success:(void (^)(id))success fail:(void (^)(NSError *error))fail{
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //请求的结果是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}


@end
