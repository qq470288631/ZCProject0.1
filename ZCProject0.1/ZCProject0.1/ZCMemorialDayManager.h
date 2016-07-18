//
//  ZCMemorialDayManager.h
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/18.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZCMemorialDayModel.h"

@interface ZCMemorialDayManager : NSObject


//创建纪念日表
- (BOOL)createMemorialDayTable;

//为当前用户添加纪念日
-(BOOL)addMemorialDayWithTitle:(NSString *)title date:(NSString *)date;

//根据纪念日标题获取日期
- (ZCMemorialDayModel *)getMemorialDayDateWithTitle:(NSString *)title;

//根据纪念日标题更新纪念日
- (BOOL)updateMemorialDayWithTitle:(NSString *)title forDate:(NSString *)date;
@end
