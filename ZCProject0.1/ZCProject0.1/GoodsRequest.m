//
//  GoodsRequest.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "GoodsRequest.h"
static NSString *kHomeDataPath = @"http://open3.bantangapp.com/recommend/index?";
@implementation GoodsRequest


-(void)requestHomeList{
    CZRequestHelper * request = [CZRequestHelper sharedRequestHelper];
    
    NSMutableDictionary *parameters =[self commonParameters].mutableCopy;
    parameters[@"page"] = @1;
    parameters[@"pagesize"] = @(20);
    
    
    [request getRequestWithUrl:kHomeDataPath parameters:parameters successResponse:^(NSDictionary *dic) {
       
        NSLog(@"%@",dic);
        
    } failureResponse:^(NSError *error) {
        
        
    }];
}

- (NSDictionary *)commonParameters {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    dict[@"app_id"] = @"com.jzyd.BanTang";
    dict[@"app_installtime"] = @(1462985294);
    dict[@"app_versions"] = @(5.7);
    dict[@"channel_name"] = @"appStore";
    dict[@"client_id"] = @"bt_app_ios";
    dict[@"client_secret"] = @"9c1e6634ce1c5098e056628cd66a17a5";
    dict[@"last_get_time"] = @(1463238932);
    dict[@"os_versions"] = @"9.3.1";
    dict[@"screensize"] = @(750);
    dict[@"track_device_info"] = @"iPhone8";
    dict[@"track_deviceid"] = @"476C2ABB-9058-4621-930B-158CBB91354B";
    dict[@"v"] = @(12);
    
    return dict.copy;
}


@end
