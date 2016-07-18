//
//  FriendListTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/14.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "FriendListTableViewCell.h"

@implementation FriendListTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.friendsLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, WindownWidth - 80, 40)];
        self.friendsLable.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_friendsLable];
        self.friendsImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 90, 90)];
        self.friendsImage.layer.masksToBounds = YES;
        self.friendsImage.layer.cornerRadius = self.friendsImage.frame.size.width / 2;
        [self.contentView addSubview:_friendsImage];
        
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
