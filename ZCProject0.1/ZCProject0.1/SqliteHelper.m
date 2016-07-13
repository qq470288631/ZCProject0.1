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
//数据库对象
static sqlite3 * db = nil;

@interface SqliteHelper ()

@property(nonatomic,strong)NSString * databasePath;

@end

@implementation SqliteHelper


+(SqliteHelper *)shareSqliteHelper{
    if(nil == helper){
        helper = [SqliteHelper new];
    }
    return helper;
}

-(NSString *)databasePath{
    if (_databasePath == nil) {
        
        NSString * personPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
        NSString * dbPath = [personPath stringByAppendingPathComponent:@"zcDatabase.sqlite"];
        _databasePath = dbPath;
        
    }
    return _databasePath;
}

//OpenDataBase
-(void)OpenDataBase{
    int result = sqlite3_open(self.databasePath.UTF8String, &db);
    if (result == SQLITE_OK) {
        NSLog(@"Open Done!");
    }else{
        NSLog(@"Open Error!");
    }
    
}
//CloseDataBase
-(void)CloseDataBase{
    
    int result = sqlite3_close(db);
    if (result == SQLITE_OK) {
        NSLog(@"Close Done!");
    }else{
        NSLog(@"Close Error!");
    }
}

@end
