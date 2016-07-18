//
//  ShopModel.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/16.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ShopModel.h"

@implementation ShopModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
    
}


//- (NSString *)description
//{
//    return [NSString stringWithFormat:@"title = %@, updateTime = %@", _title,_updateTime];
//}

@end
