//
//  MapTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/15.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "MapTableViewCell.h"

@implementation MapTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.mapLable = [[UILabel alloc]initWithFrame:CGRectMake(110, 0, 100, 80)];
        self.mapLable.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_mapLable];
        self.mapImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        [self.contentView addSubview:_mapImage];
        
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
