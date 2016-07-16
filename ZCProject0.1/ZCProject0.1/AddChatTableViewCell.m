//
//  AddChatTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/15.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "AddChatTableViewCell.h"

@implementation AddChatTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //这里只需要初始化，不需要设置具体的坐标
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _messageImg = [[UIImageView alloc]init];
        [self addSubview:_messageImg];
        _messageLab = [[UILabel alloc]init];
        _messageLab.numberOfLines = 0;
        [self addSubview:_messageLab];
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
