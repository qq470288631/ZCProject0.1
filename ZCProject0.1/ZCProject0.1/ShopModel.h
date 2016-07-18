//
//  ShopModel.h
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/16.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "BaseModel.h"

@interface ShopModel : BaseModel

//@property(nonatomic,strong)NSString *msg;
//
//@property(nonatomic,strong)NSString *status;
//
//@property(nonatomic,strong)NSString *ts;

@property (nonatomic, copy) NSString *tags;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger category;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *updateTime;
@property (nonatomic,assign) BOOL islike;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *productPicHost;
@property (nonatomic, copy) NSString *userAvatrHost;
@property (nonatomic, copy) NSString *shareUrl;
@property (nonatomic, copy) NSString *sharePic;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, strong) NSDictionary *activity;
@property (nonatomic, strong) NSArray *product;


@end
