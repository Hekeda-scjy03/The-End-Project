
//
//  QFXTools.m
//  QuFaXian
//
//  Created by licong on 16/5/23.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXTools.h"

@implementation QFXTools

+ (NSString *)dateStringToTimeString:(NSString *)dateStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *date = [dateFormatter dateFromString:dateStr];
    
    //创建一个日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    if (!date) {
        return nil;
    }
    
    //通过日历对象，判断date是否是昨天的日期
    if ([calendar isDateInYesterday:date]) {
        
        dateFormatter.dateFormat = @"HH:mm:ss";
        
        return [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:date]];
    }
    
    //通过日历对象，判断date是否是今天的日期
    if ([calendar isDateInToday:date]) {
        
        dateFormatter.dateFormat = @"HH:mm:ss";
        
        
        return [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:date]];
    }
    
    dateFormatter.dateFormat = @"MM-dd HH:mm:ss";
    
    return [dateFormatter stringFromDate:date];
}

@end
