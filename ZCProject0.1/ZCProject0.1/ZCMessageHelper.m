//
//  ZCMessageHelper.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/22.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ZCMessageHelper.h"

@implementation ZCMessageHelper

-(void)sendMessage:(EMMessage *)message{

    [[EMClient sharedClient].chatManager asyncSendMessage:message progress:nil completion:^(EMMessage *aMessage, EMError *aError) {
    
    }];
    
}

- (void)sendTextMessageWithMessage:(NSString *)messageText To:(NSString *)ausername{
    
    EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithText:messageText];
    NSString * from = [[EMClient sharedClient] currentUsername];
    
    //生成Message
    EMMessage *message = [[EMMessage alloc] initWithConversationID:ausername from:from to:ausername body:body ext:nil];
    message.chatType = EMChatTypeChat;// 设置为单聊消息
    
    
    [self sendMessage:message];
    
}

- (void)sendImageMessageWithImage:(UIImage *)aimage To:(NSString *)ausername{
    
    NSData * data = UIImagePNGRepresentation(aimage);
    
    EMImageMessageBody *body = [[EMImageMessageBody alloc] initWithData:data displayName:@"image.png"];
    NSString *from = [[EMClient sharedClient] currentUsername];
    
    //生成Message
    EMMessage *message = [[EMMessage alloc] initWithConversationID:ausername from:from to:ausername body:body ext:nil];
    message.chatType = EMChatTypeChat;// 设置为单聊消息
    
        [self sendMessage:message];
    
}

- (void)sendAudioMessageWithAudioPath:(NSString * )path To:(NSString *)ausername{

    EMVoiceMessageBody *body = [[EMVoiceMessageBody alloc] initWithLocalPath:path displayName:@"audio"];
    body.duration = 1;
    NSString *from = [[EMClient sharedClient] currentUsername];
    
    // 生成message
    EMMessage *message = [[EMMessage alloc] initWithConversationID:ausername from:from to:ausername body:body ext:nil];
    message.chatType = EMChatTypeChat;// 设置为单聊消息
    
        [self sendMessage:message];
    
}

- (NSArray *)getAllFriends{

    EMError *error = nil;
    NSArray *userlist = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
    if (!error) {
        return userlist;
    }
    return nil;
    
}

@end
