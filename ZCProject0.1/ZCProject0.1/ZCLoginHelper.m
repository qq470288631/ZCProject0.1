//
//  ZCLoginHelper.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/15.
//  Copyright © 2016年 唐旭. All rights reserved.
//

//单例存储静态变量
static ZCLoginHelper * loginHelper = nil;

#import "ZCLoginHelper.h"

@implementation ZCLoginHelper

+(ZCLoginHelper *)shareZCLoginHelper{
    if(nil == loginHelper){
        loginHelper = [ZCLoginHelper new];
    }
    return loginHelper;
}

- (BOOL)loginWithUsername:(NSString *)username password:(NSString *)aPassword{
    EMError *error = [[EMClient sharedClient] loginWithUsername:username password:aPassword];
    if (!error)
    {
        [[EMClient sharedClient].options setIsAutoLogin:YES];
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)registerWithUsername:(NSString *)username password:(NSString *)aPassword{
    EMError *error = [[EMClient sharedClient] registerWithUsername:username password:aPassword];
    if (!error)
    {
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)logout{
    EMError *error1 = [[EMClient sharedClient] logout:YES];
    if (!error1) {
        [[EMClient sharedClient].options setIsAutoLogin:NO];
        return YES;
    }else{
        return NO;
    }
}

@end
