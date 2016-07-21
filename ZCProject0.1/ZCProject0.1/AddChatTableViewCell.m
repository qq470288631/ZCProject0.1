//
//  AddChatTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/15.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "AddChatTableViewCell.h"

@implementation AddChatTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
        self.headImage.layer.cornerRadius = self.headImage.frame.size.width / 2;
        self.headImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_headImage];
        self.messageLable = [[UILabel alloc]init];
        self.messageLable.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_messageLable];
        
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
