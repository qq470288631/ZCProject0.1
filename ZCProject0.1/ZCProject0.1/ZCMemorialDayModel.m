//
//  ZCMemorialDayModel.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/18.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ZCMemorialDayModel.h"

@implementation ZCMemorialDayModel

- (instancetype)initWithID:(int)ID title:(NSString *)title date:(NSString *)date day:(NSString *)day
{
    self = [super init];
    if (self) {
        _ID = ID;
        _title = title;
        _date = date;
        _day = day;
    }
    return self;
}

@end
