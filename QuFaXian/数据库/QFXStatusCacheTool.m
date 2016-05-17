//
//  QFXStatusCacheTool.m
//  FMDB封装
//
//  Created by hzy on 16/5/11.
//  Copyright © 2016年 hzy. All rights reserved.
//

#import "QFXStatusCacheTool.h"
#import "FMDB.h"

@implementation QFXStatusCacheTool

static FMDatabase *_db;

#pragma mark - initialize

+ (void)initialize
{
    NSArray *pathes = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [pathes lastObject];
    
    NSString *dbPath = [path stringByAppendingPathComponent:@"qfxDB.sqlite"];
    
    // 创建一个数据库实例
    _db = [FMDatabase databaseWithPath:dbPath];
    
    
    NSLog(@"%@",dbPath);
    
    // 打开数据库
    if ([_db open]) {
        NSLog(@"打开成功");
    }else{
        NSLog(@"打开失败");
    }
    
    // 创建表格(创建8张表)
    // 推荐：t_explore
    // 关注：t_following
    // 视频：t_video
    // 音乐：t_music
    // 画册：t_gallery
    // 发现：t_found
    // 动态：t_dynamic
    // 我的：t_me
    
    NSArray *tableNameArray = @[@"t_explore",@"t_following",@"t_video",@"t_music",@"t_gallery",@"t_found",@"t_dynamic",@"t_me"];
    
    [self createTableName:tableNameArray];
}

#pragma mark - 创建表格
+ (void)createTableName:(NSArray *)tableNameArray
{
    for (NSString *tableName in tableNameArray) {
         //  id：
         //  idstr：每条数据的标志
         //  access_token：帐户
         //  dict：每一条数据（每个cell的数据）
      
        NSString *sql = [NSString stringWithFormat:@"create table if not exists %@ (id integer primary key autoincrement,idstr text,access_token text,dict blob);",tableName];
        
        BOOL flag = [_db executeUpdate:sql];
        
        if (flag) {
            NSLog(@"创建成功");
        }else{
            NSLog(@"创建失败");
        }
    }
}

#pragma mark - 存数据
// 数组 statuses 保存的是网络请求之后返回的数据
+ (void)saveWithStatus:(NSArray *)statuses intoTable:(NSString *)tableName
{
    // 遍历数组
    for (NSDictionary *dict in statuses) {
        
        NSString *idstr = nil;
        NSString *access_token = nil;
        
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dict];
        
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO %@ (idstr,access_token,dict) VALUES (?,?,?)",tableName];
        BOOL flag = [_db executeUpdate:sql,idstr,access_token,data];
    
        if (flag) {
            NSLog(@"插入成功");
        }else{
            NSLog(@"插入失败");
        }
    }
}

#pragma mark - 取数据
+ (NSArray *)getStatusWithTableName:(NSString *)tableName
{
    NSString *sql = [NSString stringWithFormat:@"select * from %@",tableName];
    FMResultSet *resultSet = [_db executeQuery:sql];
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    while ([resultSet next]) {
        NSData *data = [resultSet dataForColumn:@"dict"];
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [arrM addObject:dict];
    }
    return arrM;
}
@end
