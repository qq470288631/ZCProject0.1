//
//  LoverZoneHeaderTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/15.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "LoverZoneHeaderTableViewCell.h"

@implementation LoverZoneHeaderTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.visiteImage = [[UIImageView alloc]initWithFrame:CGRectMake(240, 250, 50, 50)];
        [self.contentView addSubview:_visiteImage];
        self.visiteLable = [[UILabel alloc]initWithFrame:CGRectMake(300, 250, 200, 50)];
        self.visiteLable.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_visiteLable];
        
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
