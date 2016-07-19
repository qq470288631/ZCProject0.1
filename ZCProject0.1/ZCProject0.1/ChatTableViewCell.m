//
//  ChatTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/15.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ChatTableViewCell.h"

@implementation ChatTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.chatLable = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 100, 80)];
        self.chatLable.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_chatLable];
        self.chatImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 40, 40)];
        [self.contentView addSubview:_chatImage];
        
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
