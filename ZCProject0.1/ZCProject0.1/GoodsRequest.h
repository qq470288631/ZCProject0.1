//
//  GoodsRequest.h
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZRequestHelper.h"
@interface GoodsRequest : BaseRequest


//-(void)requestHomeList;

- (void)getRequestWithUrl:(NSString *)url
               parameters:(NSDictionary *)parametersDic
          successResponse:(SuccessResponse)success
          failureResponse:(FailureResponse) failure;

@end
