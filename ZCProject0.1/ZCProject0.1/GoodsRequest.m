//
//  GoodsRequest.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "GoodsRequest.h"
#import "GoodsModel.h"

@implementation GoodsRequest


//-(void)requestHomeList{
//    CZRequestHelper * request = [CZRequestHelper sharedRequestHelper];
//    
//    NSMutableDictionary *parameters =[self commonParameters].mutableCopy;
//    parameters[@"page"] = @1;
//    parameters[@"pagesize"] = @(20);
//    
//    
//    [request getRequestWithUrl:kHomeDataPath parameters:parameters successResponse:^(NSDictionary *dic) {
//       
//        NSMutableArray *array = [NSMutableArray array];
//        
//        array = [dic objectForKey:@"data"];
//        
//        for (NSDictionary *dict in array) {
//            GoodsModel *GDmodel = [GoodsModel new];
//            
//            [GDmodel setValuesForKeysWithDictionary:dict];
//            
//            
//        }
//
//        
//        
//        
//        
//    } failureResponse:^(NSError *error) {
//        
//        
//        
//        
//        
//    }];
//}




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










@end
