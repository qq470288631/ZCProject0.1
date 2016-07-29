//
//  InviteViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/22.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "InviteViewController.h"

@interface InviteViewController ()
@property(nonatomic, strong)UILabel *inviteLable;
@property(nonatomic, strong)UITextField *inviteTextField;
@property(nonatomic, strong)UIView *upView;
@property(nonatomic, strong)UILabel *secondInviteLable;
@end

@implementation InviteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"6.jpg"]];
    _upView = [[UIView alloc]initWithFrame:CGRectMake(50, 200, WindownWidth - 100, WindowHeight - 400)];
    _upView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_upView];
    _inviteLable = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, self.upView.frame.size.width - 100, 40)];
    _inviteLable.text = @"快去邀请Ta吧~";
    _inviteLable.font = [UIFont systemFontOfSize:24];
    [self.upView addSubview:_inviteLable];
    _inviteTextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 120, self.upView.frame.size.width - 100, 40)];
    _inviteTextField.placeholder = @"请输入QQ号";
    [self.upView addSubview:_inviteTextField];
    _secondInviteLable = [[UILabel alloc]initWithFrame:CGRectMake(120, 190, self.upView.frame.size.width - 240, 40)];
    _secondInviteLable.text = @"❤️邀请";
    _secondInviteLable.font = [UIFont systemFontOfSize:24];
    [self.upView addSubview:_secondInviteLable];
    CAEmitterLayer * snowEmitterLayer = [CAEmitterLayer layer];
    snowEmitterLayer.emitterPosition = CGPointMake(100, -30);
    snowEmitterLayer.emitterSize = CGSizeMake(self.view.bounds.size.width * 2, 0);
    snowEmitterLayer.emitterMode = kCAEmitterLayerOutline;
    snowEmitterLayer.emitterShape = kCAEmitterLayerLine;
    //    snowEmitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    CAEmitterCell * snowCell = [CAEmitterCell emitterCell];
    snowCell.contents = (__bridge id)[UIImage imageNamed:@"樱花瓣2"].CGImage;
    
    // 花瓣缩放比例
    snowCell.scale = 0.02;
    snowCell.scaleRange = 0.5;
    
    // 每秒产生的花瓣数量
    snowCell.birthRate = 7;
    snowCell.lifetime = 80;
    
    // 每秒花瓣变透明的速度
    snowCell.alphaSpeed = -0.01;
    
    // 秒速“五”厘米～～
    snowCell.velocity = 40;
    snowCell.velocityRange = 60;
    
    // 花瓣掉落的角度范围
    snowCell.emissionRange = M_PI;
    
    // 花瓣旋转的速度
    snowCell.spin = M_PI_4;
    
    // 每个cell的颜色
    //    snowCell.color = [[UIColor redColor] CGColor];
    
    // 阴影的 不透明 度
    snowEmitterLayer.shadowOpacity = 1;
    // 阴影化开的程度（就像墨水滴在宣纸上化开那样）
    snowEmitterLayer.shadowRadius = 8;
    // 阴影的偏移量
    snowEmitterLayer.shadowOffset = CGSizeMake(3, 3);
    // 阴影的颜色
    snowEmitterLayer.shadowColor = [[UIColor whiteColor] CGColor];
    
    
    snowEmitterLayer.emitterCells = [NSArray arrayWithObject:snowCell];
    [_upView.layer addSublayer:snowEmitterLayer];
    




}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
