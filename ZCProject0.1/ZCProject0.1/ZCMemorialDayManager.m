//
//  ZCMemorialDayManager.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/18.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ZCMemorialDayManager.h"

@interface ZCMemorialDayManager ()

@property(nonatomic,strong)SqliteHelper * helper;

@property(nonatomic,strong)ZCLoginHelper * loginHelper;

@end

@implementation ZCMemorialDayManager

-(SqliteHelper *)helper{
    if (_helper == nil) {
        _helper = [SqliteHelper shareSqliteHelper];
    }
    return _helper;
}

-(ZCLoginHelper *)loginHelper{
    if (_loginHelper == nil) {
        _loginHelper = [ZCLoginHelper shareZCLoginHelper];
    }
    return _loginHelper;
}

- (BOOL)createMemorialDayTable{

    NSString * sql = @"CREATE TABLE IF NOT EXISTS ZC_MemorialDay (id INTEGER PRIMARY KEY AUTOINCREMENT,username TEXT NOT NULL,title TEXT NOT NULL UNIQUE,memorialDayDate TEXT NOT NULL)";
    BOOL result = [self.helper executeUpdate:sql];
    return result;
}

-(BOOL)addMemorialDayWithTitle:(NSString *)title date:(NSString *)date{

    NSString * sql = [NSString stringWithFormat:@"INSERT INTO ZC_MemorialDay(title,memorialDayDate,username) VALUES ('%@','%@','%@')",title,date,[self.loginHelper getNSUserDefaultsUsername]];
    BOOL result = [self.helper executeUpdate:sql];
    return result;
    
}

- (ZCMemorialDayModel *)getMemorialDayDateWithTitle:(NSString *)title{

    NSString * sql = [NSString stringWithFormat:@"SELECT id,title,memorialDayDate FROM ZC_MemorialDay WHERE title = '%@' AND memorialDayDate = '%@'",title,[self.loginHelper getNSUserDefaultsUsername]];
    FMResultSet * set = [self.helper executeQuery:sql];
    ZCMemorialDayModel * model = [ZCMemorialDayModel new];
    while ([set next]) {
        int ID = [set intForColumn:@"id"];
        NSString * title = [set stringForColumn:@"title"];
        NSString * date = [set stringForColumn:@"memorialDayDate"];
        model = [[ZCMemorialDayModel alloc] initWithID:ID title:title date:date];
    }
    return model;
}

- (BOOL)updateMemorialDayWithTitle:(NSString *)title forDate:(NSString *)date{

    NSString * sql = [NSString stringWithFormat:@"UPDATE ZC_MemorialDay SET memorialDayDate = '%@' WHERE title = '%@' AND memorialDayDate = '%@' ;",date,title,[self.loginHelper getNSUserDefaultsUsername]];
    BOOL result = [self.helper executeUpdate:sql];
    return result;
    
}

- (NSMutableArray *)getAllMemorialDay{
    NSMutableArray * dataArray = [NSMutableArray array];
    NSString * sql = [NSString stringWithFormat:@"SELECT id,title,memorialDayDate FROM ZC_MemorialDay"];
    FMResultSet * set = [self.helper executeQuery:sql];
    while ([set next]) {
        
        ZCMemorialDayModel * model = [ZCMemorialDayModel new];
        int ID = [set intForColumn:@"id"];
        NSString * title = [set stringForColumn:@"title"];
        NSString * date = [set stringForColumn:@"memorialDayDate"];
        model = [[ZCMemorialDayModel alloc] initWithID:ID title:title date:date];
        [dataArray addObject:model];
    }
    return dataArray;
}


@end
