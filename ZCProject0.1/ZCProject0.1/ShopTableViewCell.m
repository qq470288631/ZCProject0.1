//
//  ShopTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/16.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ShopTableViewCell.h"

#define Kwidth self.contentView.frame.size.width
#define KHeith self.contentView.frame.size.height

@interface ShopTableViewCell ()<UIScrollViewDelegate>

@end

@implementation ShopTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.titleLabel=[[UILabel alloc]init];
        self.imageV=[[UIImageView alloc]init];
        
        self.descLabel=[[UILabel alloc]init];
        
        
        
        
         [self.contentView addSubview:self.titleLabel];
        
         [self.contentView addSubview:self.descLabel];
        
         [self.contentView addSubview:self.imageV];
        
    }
    
    return self;
    
}


    


-(void)layoutSubviews{
    
    
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(Kwidth *0.1, KHeith, Kwidth *0.8, KHeith *0.1);
    
    self.descLabel.frame = CGRectMake(Kwidth *0.1, KHeith *0.12, Kwidth *0.8, KHeith *0.3);
    
    self.imageV.frame = CGRectMake(Kwidth *0.1, KHeith *0.45, Kwidth *0.8, KHeith *0.4);
    
    
    
    
    
//    
//    [self.contentView addSubview:self.titleLabel];
//    
//    [self.contentView addSubview:self.descLabel];
//    
//    [self.contentView addSubview:self.imageV];
    
    
    
    
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    
    
}
    
    






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
