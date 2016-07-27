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
        
        self.loveLabel = [[UILabel alloc]init];
        
        self.commentBtn = [[UIButton alloc]init];
        
        self.purBtn = [[UIButton alloc]init];
        
        self.priceLabel = [[UILabel alloc]init];
        
        
        
        
         [self.contentView addSubview:self.titleLabel];
        
         [self.contentView addSubview:self.descLabel];
        
         [self.contentView addSubview:self.imageV];
        
        [self.contentView addSubview:self.loveLabel];
        
        [self.contentView addSubview:self.commentBtn];
        
        [self.contentView addSubview:self.purBtn];
        
        [self.contentView addSubview:self.priceLabel];
        
    }
    
    return self;
    
}


    


-(void)layoutSubviews{
    
    
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(Kwidth *0.1, KHeith *0.01, Kwidth *0.8, KHeith *0.1);
    
    self.titleLabel.numberOfLines = 0;
    
    self.descLabel.frame = CGRectMake(Kwidth *0.1, KHeith *0.12, Kwidth *0.8, KHeith *0.3);
    
    [self.descLabel sizeToFit];
    
    self.descLabel.frame = CGRectMake(Kwidth *0.1, KHeith *0.12, Kwidth *0.8, self.descLabel.frame.size.height);
    
    self.descLabel.numberOfLines = 0;
    
    self.imageV.frame = CGRectMake(Kwidth *0.1,CGRectGetMaxY(self.descLabel.frame)+10 , Kwidth *0.8, 200);
    
    self.loveLabel.frame = CGRectMake(Kwidth *0.4, CGRectGetMaxY(self.imageV.frame)+40, Kwidth *0.2, 10);
    
    self.commentBtn.frame = CGRectMake(Kwidth *0.1, CGRectGetMaxY(self.imageV.frame)+40, Kwidth *0.1, 10);
    
    
    self.purBtn.frame = CGRectMake(Kwidth *0.8, CGRectGetMaxY(self.imageV.frame)+40, Kwidth *0.1, 10);
    
    self.priceLabel.frame = CGRectMake(Kwidth *0.6, CGRectGetMaxY(self.imageV.frame)+10, Kwidth *0.3, 10);
    

    
    [self.purBtn setTitle:@"购买" forState:(UIControlStateNormal)];
    
    [self.purBtn setTitleColor:[UIColor cyanColor] forState:(UIControlStateNormal)];
    
    
    [self.purBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];

    
    
    
    
}

-(void)clickAction:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(didSelectedBuyButtonWithCellIndexPath:)]) {
        [self.delegate didSelectedBuyButtonWithCellIndexPath:self.indexPath];
        
    }
    
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
