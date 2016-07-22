//
//  ShopTableViewCell.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/16.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ShopTableViewCell.h"
#import "WebViewController.h"

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
    
    self.descLabel.frame = CGRectMake(Kwidth *0.1, KHeith *0.12, Kwidth *0.8, KHeith *0.3);
    
    [self.descLabel sizeToFit];
    
    self.descLabel.frame = CGRectMake(Kwidth *0.1, KHeith *0.12, Kwidth *0.8, self.descLabel.frame.size.height);
    
    self.imageV.frame = CGRectMake(Kwidth *0.1, KHeith *0.45, Kwidth *0.8, KHeith *0.4);
    
    self.loveLabel.frame = CGRectMake(Kwidth *0.4, KHeith *0.9, Kwidth *0.2, KHeith *0.1);
    
    self.commentBtn.frame = CGRectMake(Kwidth *0.1, KHeith *0.9, Kwidth *0.1, KHeith *0.1);
    
    
    self.purBtn.frame = CGRectMake(Kwidth *0.8, KHeith *0.9, Kwidth *0.1, KHeith *0.1);
    
    self.priceLabel.frame = CGRectMake(Kwidth *0.6, KHeith *0.86, Kwidth *0.3, KHeith *0.04);
    
    
    [self.purBtn addTarget:self action:@selector(purBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    

}

-(void)purBtnAction:(UIButton *)sender{
   
    if ([self.delegate respondsToSelector:@selector(dlickpurBtn:)]) {
        [self.delegate dlickpurBtn:self.indexPath];
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
