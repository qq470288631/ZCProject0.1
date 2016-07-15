//
//  ProvingLoginStatus.h
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/14.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvingLoginStatus : NSObject

/**
 *  获取登录验证单例实例
 *
 *  @return 唯一实例
 */
+(ProvingLoginStatus *)shareProvingLoginStatus;


/**
 *  检测登录状态
 *
 *  @return 是否登录
 */
- (BOOL)checkoutLoginStatus;

/**
 *  检测未登录模态登录界面
 *
 *  @param controller 视图控制器
 */
- (void)checkoutLoginStatusShowLoginViewONController:(UIViewController *)controller;

/**
 *  在控制器上模态登录页面
 *
 *  @param controller 视图控制器
 */
- (void)showLoginViewOnController:(UIViewController *)controller;

@end
