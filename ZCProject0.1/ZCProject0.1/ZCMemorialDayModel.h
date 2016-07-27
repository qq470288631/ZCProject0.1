//
//  ZCMemorialDayModel.h
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/18.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "BaseModel.h"

@interface ZCMemorialDayModel : BaseModel

//ID
@property(nonatomic,assign)int ID;

//纪念日标题
@property(nonatomic,strong)NSString * title;

//日期
@property(nonatomic,strong)NSString * date;

//第几天
@property(nonatomic,strong)NSString * day;


//初始化方法
- (instancetype)initWithID:(int)ID title:(NSString *)title date:(NSString *)date day:(NSString *)day;

@end
