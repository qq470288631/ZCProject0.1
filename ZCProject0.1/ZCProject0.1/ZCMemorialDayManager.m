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

    NSString * sql = @"CREATE TABLE IF NOT EXISTS ZC_MemorialDay (id INTEGER PRIMARY KEY AUTOINCREMENT,username TEXT NOT NULL,title TEXT NOT NULL UNIQUE,memorialDayDate TEXT NOT NULL,memorialDay TEXT NOT NULL)";
    BOOL result = [self.helper executeUpdate:sql];
    return result;
}

-(BOOL)addMemorialDayWithTitle:(NSString *)title date:(NSString *)date day:(NSString *)day{

    NSString * sql = [NSString stringWithFormat:@"INSERT INTO ZC_MemorialDay(title,memorialDayDate,memorialDay,username) VALUES ('%@','%@','%@','%@')",title,date,day,[self.loginHelper getNSUserDefaultsUsername]];
    BOOL result = [self.helper executeUpdate:sql];
    return result;
    
}
//删除纪念日
-(BOOL)deleteMemorialDayWithTitle:(NSString *)title{
    NSString * sql = [NSString stringWithFormat:@"DELETE FROM ZC_MemorialDay WHERE title = '%@' AND username = '%@'",title,[self.loginHelper getNSUserDefaultsUsername]];
    BOOL result = [self.helper executeUpdate:sql];
    return result;



}
- (ZCMemorialDayModel *)getMemorialDayDateWithTitle:(NSString *)title{

    NSString * sql = [NSString stringWithFormat:@"SELECT id,title,memorialDayDate,memorialDay FROM ZC_MemorialDay WHERE title = '%@' AND username = '%@'",title,[self.loginHelper getNSUserDefaultsUsername]];
    FMResultSet * set = [self.helper executeQuery:sql];
    ZCMemorialDayModel * model = [ZCMemorialDayModel new];
    while ([set next]) {
        int ID = [set intForColumn:@"id"];
        NSString * title = [set stringForColumn:@"title"];
        NSString * date = [set stringForColumn:@"memorialDayDate"];
        NSString * day = [set stringForColumn:@"memorialDay"];
        model = [[ZCMemorialDayModel alloc] initWithID:ID title:title date:date day:day];
    }
    return model;
}

- (BOOL)updateMemorialDayWithTitle:(NSString *)title forDate:(NSString *)date andDay:(NSString *)day{

    NSString * sql = [NSString stringWithFormat:@"UPDATE ZC_MemorialDay SET memorialDayDate = '%@' memorialDay = '%@' WHERE title = '%@'  AND username = '%@'",date,day,title,[self.loginHelper getNSUserDefaultsUsername]];
    BOOL result = [self.helper executeUpdate:sql];
    return result;
    
}

- (NSMutableArray *)getAllMemorialDay{
    NSMutableArray * dataArray = [NSMutableArray array];
    NSString * sql = [NSString stringWithFormat:@"SELECT id,title,memorialDayDate,memorialDay FROM ZC_MemorialDay"];
    FMResultSet * set = [self.helper executeQuery:sql];
    while ([set next]) {
        
        ZCMemorialDayModel * model = [ZCMemorialDayModel new];
        int ID = [set intForColumn:@"id"];
        NSString * title = [set stringForColumn:@"title"];
        NSString * date = [set stringForColumn:@"memorialDayDate"];
        NSString * day = [set stringForColumn:@"memorialDay"];
        model = [[ZCMemorialDayModel alloc] initWithID:ID title:title date:date day:day];
        [dataArray addObject:model];
    }
    return dataArray;
}


@end
