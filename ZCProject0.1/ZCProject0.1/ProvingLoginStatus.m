//
//  ProvingLoginStatus.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/14.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ProvingLoginStatus.h"

//单例存储静态变量
static ProvingLoginStatus * provingLoginStatus = nil;

@implementation ProvingLoginStatus


+(ProvingLoginStatus *)shareProvingLoginStatus{
    if(nil == provingLoginStatus){
        provingLoginStatus = [ProvingLoginStatus new];
    }
    return provingLoginStatus;
}

- (BOOL)checkoutLoginStatus{
    
    BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
    return isAutoLogin;
    
}

@end
