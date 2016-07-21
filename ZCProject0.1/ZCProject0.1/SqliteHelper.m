//
//  SqliteHelper.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "SqliteHelper.h"

//单例存储静态变量
static SqliteHelper * helper = nil;


@interface SqliteHelper ()

@property(nonatomic,strong)FMDatabase * database;

@end

@implementation SqliteHelper


+(SqliteHelper *)shareSqliteHelper{
    if(nil == helper){
        helper = [SqliteHelper new];
        
        NSString * personPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
        NSString * dbPath = [personPath stringByAppendingPathComponent:@"zcDatabase.sqlite"];
        NSLog(@"s = %@",dbPath);
        helper.database = [FMDatabase databaseWithPath:dbPath];
    }
    return helper;
}


- (BOOL)executeUpdate:(NSString *)sqlString{
    if ([_database open]) {
        
        BOOL result =  [self.database executeUpdate:sqlString];
        [_database close];
        return result;
    }else{
        [_database close];
        return NO;
    }
}

- (FMResultSet *)executeQuery:(NSString *)sqlString{

    if ([_database open]) {
        
        FMResultSet * resultSet = [self.database executeQuery:sqlString];
         [_database close];
        return resultSet;
    }else{
        [_database close];
        return nil;
    }
}



@end
