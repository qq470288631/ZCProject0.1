//
//  AddMemorailViewController.h
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCMemorialDayModel.h"
typedef void(^block)();
@interface AddMemorailViewController : UIViewController
@property (nonatomic, copy) block myBlock;

@end
