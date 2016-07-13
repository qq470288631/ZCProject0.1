//
//  AddLoverTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "AddLoverTableViewCell.h"

@implementation AddLoverTableViewCell
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//
//
//    }
//    return self;
//}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.clickedLable = [[UILabel alloc]init];
        self.clickedLable.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_clickedLable];
    }

    return self;
}

- (void)awakeFromNib {
   
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.clickedLable.frame = CGRectMake(0, 0, self.frame.size.width, 60);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
