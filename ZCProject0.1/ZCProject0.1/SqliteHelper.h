//
//  SqliteHelper.h
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "BaseSqlite.h"

@interface SqliteHelper : BaseSqlite

/**
 *  获取帮助类单例实例
 *
 *  @return 实例
 */
+(SqliteHelper *)shareSqliteHelper;

/**
 *  执行Sql语句（返回BOOL） 适用于 Create Update Delete 等
 *
 *  @param sqlString Sql语句
 *
 *  @return 执行结果
 */
- (BOOL)executeUpdate:(NSString *)sqlString;


/**
 *  执行Sql语句（返回结果集） 适用于 Select 等
 *
 *  @param sqlString Sql语句
 *
 *  @return 返回执行结果
 */
- (FMResultSet *)executeQuery:(NSString *)sqlString;

@end
