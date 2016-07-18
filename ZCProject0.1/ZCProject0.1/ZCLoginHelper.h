//
//  ZCLoginHelper.h
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/15.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCLoginHelper : NSObject


/**
 *  单例
 *
 *  @return 实体
 */
+(ZCLoginHelper *)shareZCLoginHelper;

/**
 *  登录（记录登录状态）
 *
 *  @param username  用户名
 *  @param aPassword 密码
 *
 *  @return 登录结果
 */
- (BOOL)loginWithUsername:(NSString *)username password:(NSString *)aPassword;

/**
 *  注册
 *
 *  @param username  用户名
 *  @param aPassword 密码
 *
 *  @return 注册结果
 */
- (BOOL)registerWithUsername:(NSString *)username password:(NSString *)aPassword;

/**
 *  登出
 *
 *  @return 登出结果
 */
- (BOOL)logout;

//存储用户名在NSUserDefaults中
- (void)setNSUserDefaultsWithUsername:(NSString *)username;

//读取用户名在NSUserDefaults中
-(NSString *)getNSUserDefaultsUsername;



@end
