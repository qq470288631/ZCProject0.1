//
//  MemorailDayTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "MemorailDayTableViewCell.h"

@implementation MemorailDayTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width - 100, 40)];
        self.titleLable.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_titleLable];
        self.dateLable = [[UILabel alloc]initWithFrame:CGRectMake(0, self.titleLable.frame.size.height, 50, 30)];
        self.dateLable.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_dateLable];
        self.dayLable = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 10, 0, 100, 50)];
        self.dayLable.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_dayLable];
        
        
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
