//
//  QFXVideoDataModel.h
//  QuFaXian
//
//  Created by hzy on 16/5/20.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFXVideoDataModel : NSObject
// cell的高度
@property (nonatomic, assign) CGFloat cellHeight;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)videoDataModelWithDict:(NSDictionary *)dict;

@end
