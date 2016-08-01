//
//  ZCMessageHelper.h
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/22.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCMessageHelper : NSObject
-(void)sendMessage:(EMMessage *)message;
- (void)sendTextMessageWithMessage:(NSString *)messageText To:(NSString *)ausername;
- (void)sendImageMessageWithImage:(UIImage *)aimage To:(NSString *)ausername;
- (void)sendAudioMessageWithAudioPath:(NSString * )path To:(NSString *)ausername;
- (NSArray *)getAllFriends;
@end
