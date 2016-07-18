//
//  MainTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "MainTableViewCell.h"

#define KWidth self.contentView.frame.size.width

#define Kheight self.contentView.frame.size.height

@implementation MainTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addAllViews];
    }
    return self;
    
    
}


-(void)addAllViews{
    
    self.ComImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KWidth, Kheight*0.8)];
    
    self.explaLabel = [[UILabel alloc]initWithFrame:CGRectMake(KWidth * 0.2, Kheight *0.8, KWidth * 0.6, Kheight *0.1)];
    
    self.loveLabel = [[UILabel alloc]initWithFrame:CGRectMake(KWidth *0.4, Kheight *0.9, KWidth * 0.2, Kheight * 0.1)];
    
    
    
    
}

-(void)layoutSubviews{
    
    self.ComImageV.frame = CGRectMake(0, 0, KWidth, Kheight*0.8);
    
    self.explaLabel.frame = CGRectMake(KWidth * 0.2, Kheight *0.8, KWidth * 0.6, Kheight *0.1);
    
    self.loveLabel.frame = CGRectMake(KWidth *0.4, Kheight *0.9, KWidth * 0.2, Kheight * 0.1);
    
    [self.contentView addSubview:self.ComImageV];
    
    [self.contentView addSubview:self.explaLabel];
    
    [self.contentView addSubview:self.loveLabel];
    
    
}




- (void)awakeFromNib {

    
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
