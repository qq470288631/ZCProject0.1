//
//  MemorailTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/15.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "MemorailTableViewCell.h"

@implementation MemorailTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.memorailLable = [[UILabel alloc]initWithFrame:CGRectMake(110, 0, 100, 80)];
        self.memorailLable.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_memorailLable];
        self.memorailImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        [self.contentView addSubview:_memorailImage];
        
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
