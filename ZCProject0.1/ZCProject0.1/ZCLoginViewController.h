//
//  ZCLoginViewController.h
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//


@protocol ZCLoginViewControllerDelegate <NSObject>


- (void)LoginDone;


@end

#import "BaseViewController.h"

@interface ZCLoginViewController : BaseViewController

@property(nonatomic,weak)id<ZCLoginViewControllerDelegate> delegeta;

@end
