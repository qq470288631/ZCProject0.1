//
//  CZRequestHelper.h
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/12.
//  Copyright © 2016年 唐旭. All rights reserved.
//

/**
 *  请求成功回调
 *
 *  @param dic 请求返回的字典
 */
typedef void(^SuccessResponse)(NSDictionary * dic);

/**
 *  失败回调
 *
 *  @param error 错误信息
 */
typedef void(^FailureResponse)(NSError * error);

#import "BaseRequest.h"

@interface CZRequestHelper : BaseRequest

/**
 *  网络Get请求（无参）
 *
 *  @param url           地址
 *  @param success       成功回调
 *  @param failure       报错回调
 */
- (void)getRequestWithUrl:(NSString *)url
          successResponse:(SuccessResponse)success
          failureResponse:(FailureResponse) failure;

/**
 *  网络Get请求（参数形式）
 *
 *  @param url           地址
 *  @param parametersDic 参数
 *  @param success       成功回调
 *  @param failure       报错回调
 */
- (void)getRequestWithUrl:(NSString *)url
               parameters:(NSDictionary *)parametersDic
          successResponse:(SuccessResponse)success
          failureResponse:(FailureResponse) failure;


/**
 *  网络Post请求（带参）
 *
 *  @param url           地址
 *  @param parametersDic 参数
 *  @param success       成功回调
 *  @param failure       失败回调
 */
- (void)postRequestWithUrl:(NSString *)url
                parameters:(NSDictionary *)parametersDic
           successResponse:(SuccessResponse)success
           failureResponse:(FailureResponse) failure;


@end
