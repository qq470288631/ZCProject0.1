//
//  ZCNoMessageTableViewCell.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/20.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ZCNoMessageTableViewCell.h"

@implementation ZCNoMessageTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self showView];
    }
    return self;
}

- (void)showView{

    self.contentView.backgroundColor = [UIColor yellowColor];
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WindownWidth, 200)];
    imageView.image = [UIImage imageNamed:@"NOMessage.png"];
    
    [self.contentView addSubview:imageView];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
