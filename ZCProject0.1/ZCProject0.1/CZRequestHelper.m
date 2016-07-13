//
//  CZRequestHelper.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/12.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "CZRequestHelper.h"

@implementation CZRequestHelper


static CZRequestHelper * requestHelper = nil;
+ (CZRequestHelper *)sharedRequestHelper{

    if (requestHelper == nil) {
        requestHelper = [CZRequestHelper new];
    }
    return requestHelper;
    
}


- (void)getRequestWithUrl:(NSString *)url
       successResponse:(SuccessResponse)success
       failureResponse:(FailureResponse) failure{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    //添加数据模式类型
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    //以GET方式 通过AFNetworking 发送请求
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
}

- (void)getRequestWithUrl:(NSString *)url
               parameters:(NSDictionary *)parametersDic
          successResponse:(SuccessResponse)success
          failureResponse:(FailureResponse) failure{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    //添加数据模式类型
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    //以GET方式 通过AFNetworking 发送请求
    [manager GET:url parameters:parametersDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
}


- (void)postRequestWithUrl:(NSString *)url
             parameters:(NSDictionary *)parametersDic
        successResponse:(SuccessResponse)success
        failureResponse:(FailureResponse) failure{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    //添加数据模式类型
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    //以POST方式 通过AFNetworking 发送请求
    [manager POST:url parameters:parametersDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}


@end
