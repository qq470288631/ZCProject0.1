//
//  GoodsModel.h
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject

@property (nonatomic, strong) NSArray *topic;
@property (nonatomic, strong) NSArray *banner;
@property (nonatomic, strong) NSArray *firstpageElement;
@property (nonatomic, strong) NSArray *categoryElement;
@property (nonatomic, strong) NSArray *topic_rec;
@property (strong,nonatomic)NSString *Id;

@property (strong,nonatomic)NSString *pic;

@property (strong,nonatomic)NSString *title;

@property (strong,nonatomic)NSString *likes;

@property(strong,nonatomic)NSString *subtitle;

@property(strong,nonatomic)GoodsModel *GoodsModels;

@end
