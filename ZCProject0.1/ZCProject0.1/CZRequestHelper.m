//
//  CZRequestHelper.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/12.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "CZRequestHelper.h"

@implementation CZRequestHelper

- (void)getRequestWithUrl:(NSString *)url
       successResponse:(SuccessResponse)success
       failureResponse:(FailureResponse) failure{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    //添加数据模式类型
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
        
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
    [manager POST:url parameters:parametersDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}


@end
