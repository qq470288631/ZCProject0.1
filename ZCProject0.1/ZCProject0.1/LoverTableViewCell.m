
//
//  LoverTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/15.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "LoverTableViewCell.h"

@implementation LoverTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.loverLable = [[UILabel alloc]initWithFrame:CGRectMake(150, 0, WindownWidth - 80, 60)];
        self.loverLable.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_loverLable];
        self.loverImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 130)];
        self.loverImage.layer.masksToBounds = YES;
        self.loverImage.layer.cornerRadius = self.loverImage.frame.size.width / 2;
        [self.contentView addSubview:_loverImage];
        
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
