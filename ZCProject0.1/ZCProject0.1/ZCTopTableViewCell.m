//
//  ZCTopTableViewCell.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/20.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ZCTopTableViewCell.h"

@implementation ZCTopTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self showView];
    }
    return self;
}



- (void)showView{
    
    UILabel * addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 0, 200, 40)];
    addressLabel.text = @"北京·海淀";
    
    [self.contentView addSubview:addressLabel];
    
    UILabel * followLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(addressLabel.frame), CGRectGetMaxY(addressLabel.frame), addressLabel.frame.size.width, addressLabel.frame.size.height)];
    followLabel.text = @"0 你关注 / 0 关注你";
    [self.contentView addSubview:followLabel];
    
    
    UILabel * descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(followLabel.frame) + 5, WindowHeight - 30, 60)];
    descriptionLabel.textColor = [UIColor grayColor];
    descriptionLabel.text = @"这个家伙很懒什么都没有留下。";
    
    [self.contentView addSubview:descriptionLabel];
    
    
    //224 232 235
    
    UIView * smallLineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(descriptionLabel.frame), WindowHeight, 5)];
    smallLineView.backgroundColor = [UIColor colorWithRed:224/255.0 green:232/255.0 blue:235/255.0 alpha:1];
    
    [self.contentView addSubview:smallLineView];
    
    
    UIView * buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(smallLineView.frame), WindowHeight, 70)];
    UIImageView * buttonsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WindownWidth, 70)];
    buttonsImageView.backgroundColor = [UIColor purpleColor];
    buttonsImageView.image = [UIImage imageNamed:@"MeButtons.png"];
//    buttonsImageView.contentMode = UIViewContentModeScaleAspectFit;
    
//    buttonsImageView.contentMode = UIViewContentModeTopLeft;
    
    
//    UIImage * buttonImage = [self OriginImage:[UIImage imageNamed:@"MeButtons.png"] scaleToSize:buttonsImageView.bounds.size];
    
//    buttonsImageView.image = buttonImage;
    
    [buttonView addSubview:buttonsImageView];
    
    
    
    UIButton * collectionButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, WindownWidth/4, 70)];
    [collectionButton addTarget:self action:@selector(collectionButtonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [buttonView addSubview:collectionButton];
    
    UIButton * albumButton = [[UIButton alloc] initWithFrame:CGRectMake(WindownWidth/4, 0, WindownWidth/4, 70)];
    [albumButton addTarget:self action:@selector(albumButtonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [buttonView addSubview:albumButton];
    
    UIButton * messageButton = [[UIButton alloc] initWithFrame:CGRectMake(WindownWidth/2 , 0, WindownWidth/4, 70)];
    
    [messageButton addTarget:self action:@selector(messageButtonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [buttonView addSubview:messageButton];
    
    UIButton * remindButton = [[UIButton alloc] initWithFrame:CGRectMake((WindownWidth/4) * 3, 0, WindownWidth/4, 70)];
    
    [remindButton addTarget:self action:@selector(remindButtonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [buttonView addSubview:remindButton];
    
    [self.contentView addSubview:buttonView];
    
    
    UIView * bigLineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(buttonView.frame), WindowHeight, 15)];
    bigLineView.backgroundColor = [UIColor colorWithRed:224/255.0 green:232/255.0 blue:235/255.0 alpha:1];
    
    [self.contentView addSubview:bigLineView];
    
    
    UILabel * trendsLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(bigLineView.frame) + 15, CGRectGetMaxY(bigLineView.frame), WindownWidth - 30,50)];
    trendsLabel.text = @"你关注的朋友动态";
    
    [self.contentView addSubview:trendsLabel];
    
    
    UIImageView * smallUserImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(trendsLabel.frame) +10, 50, 50)];
    smallUserImageView.layer.cornerRadius = 25;  // 将图层的边框设置为圆脚 （值为对象宽一半为圆形）
    smallUserImageView.layer.masksToBounds = YES; // 隐藏边界
    smallUserImageView.image = [UIImage imageNamed:@"icon-cat-reload@2x.png"];
    
    [self.contentView addSubview:smallUserImageView];
    
    
    
    UITextField * publishDynamicTextFeild = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(smallUserImageView.frame) + 10, CGRectGetMinY(smallUserImageView.frame) + 5 , WindownWidth - CGRectGetMaxX(smallUserImageView.frame) - 30, smallUserImageView.frame.size.height -10 )];
    //人工增加内边距
    UIView * publishDynamicPlaceHolderPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, publishDynamicTextFeild.bounds.size.height)];
    
    //将Padding视图添加到用户名文本框左视图
    publishDynamicTextFeild.leftView = publishDynamicPlaceHolderPaddingView;
    publishDynamicTextFeild.leftViewMode = UITextFieldViewModeAlways;
    
    publishDynamicTextFeild.placeholder = @"说点什么，发个动态吧？";
    [publishDynamicTextFeild setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];//文本颜色
    
    
    publishDynamicTextFeild.background = [UIImage imageNamed:@"PublishDynamicTextFeild"];
    
    [self.contentView addSubview:publishDynamicTextFeild];
    
}

//-(UIImage *)OriginImage:(UIImage *)image scaleToSize:(CGSize)size{
//    UIGraphicsBeginImageContext(size);
//    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
//    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return scaledImage;
//}

- (void)awakeFromNib {
    

}

- (void)collectionButtonClicked:(UIButton *)sender{

    NSLog(@"1");
    
}

- (void)albumButtonClicked:(UIButton *)sender{
    
       NSLog(@"2");
    
    
}

- (void)messageButtonClicked:(UIButton *)sender{
    
    
       NSLog(@"3");
}

- (void)remindButtonClicked:(UIButton *)sender{
    
       NSLog(@"4");
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
