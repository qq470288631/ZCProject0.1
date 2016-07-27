//
//  ShopTableViewCell.h
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/16.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShopTableViewCellDelegate <NSObject>

-(void)didSelectedBuyButtonWithCellIndexPath:(NSIndexPath *)indexPath;


@end

@interface ShopTableViewCell : UITableViewCell

@property (nonatomic,weak)id<ShopTableViewCellDelegate>delegate;

@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)UILabel *descLabel;

@property(nonatomic,strong)UIImageView *imageV;

@property(nonatomic,strong)UILabel *loveLabel;

@property(nonatomic,strong)UIButton *commentBtn;

@property(nonatomic,strong)UIButton *purBtn;

@property(nonatomic,strong)UILabel *priceLabel;

@property(nonatomic,strong)NSIndexPath *indexPath;




@end
