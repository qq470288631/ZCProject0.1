//
//  RootViewController.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/12.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "RootViewController.h"
#import "ZCTabBar.h"
#import "GoodsViewController.h"
#import "ZCMeHomeViewController.h"

@interface RootViewController ()


@property(nonatomic,strong)ZCTabBar * zcTabBar;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tabBar.hidden = YES;
    
//    UIButton * acitivityButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    [acitivityButton setBackgroundImage:[UIImage imageNamed:@"paper.png"] forState:(UIControlStateNormal)];
//    [acitivityButton setBackgroundImage:[UIImage imageNamed:@"paperH.png"] forState:(UIControlStateSelected)];
//    [acitivityButton setTitle:@"推荐" forState:(UIControlStateNormal)];
//    acitivityButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//    acitivityButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -40, 0);
//    acitivityButton.titleLabel.font = [UIFont systemFontOfSize:12];
//    [acitivityButton setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    
    UIButton * movieButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [movieButton setBackgroundImage:[UIImage imageNamed:@"video.png"] forState:(UIControlStateNormal)];
    [movieButton setBackgroundImage:[UIImage imageNamed:@"videoH.png"] forState:(UIControlStateSelected)];
    [movieButton setTitle:@"好货" forState:(UIControlStateNormal)];
    movieButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    movieButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -40, 0);
    movieButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [movieButton setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    [movieButton setTitleColor:[UIColor cyanColor] forState:(UIControlStateNormal)];
    
   
    
    
    
    
    UIButton * theaterButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [theaterButton setBackgroundImage:[UIImage imageNamed:@"2image.png"] forState:(UIControlStateNormal)];
    [theaterButton setBackgroundImage:[UIImage imageNamed:@"2imageH.png"] forState:(UIControlStateSelected)];
    [theaterButton setTitle:@"圈子" forState:(UIControlStateNormal)];
    theaterButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    theaterButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -40, 0);
    theaterButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [theaterButton setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    
    [theaterButton setTitleColor:[UIColor cyanColor] forState:(UIControlStateNormal)];
    
    
    
    
    UIButton * mineButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [mineButton setBackgroundImage:[UIImage imageNamed:@"person.png"] forState:(UIControlStateNormal)];
    [mineButton setBackgroundImage:[UIImage imageNamed:@"personH.png"] forState:(UIControlStateSelected)];
    [mineButton setTitle:@"我的" forState:(UIControlStateNormal)];
    mineButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    mineButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -40, 0);
    mineButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [mineButton setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    [mineButton setTitleColor:[UIColor cyanColor] forState:(UIControlStateNormal)];
    
    
    
    
    self.zcTabBar = [[ZCTabBar alloc] initWithItems:@[movieButton,theaterButton,mineButton] frame:CGRectMake(0, self.view.bounds.size.height - 49, self.view.bounds.size.width, 49)];
    self.zcTabBar.zcDelegate = self;
    
    [self.view addSubview:self.zcTabBar];
    
//    UIViewController * v1 = [UIViewController new];
//    v1.view.backgroundColor = [UIColor redColor];
    
    GoodsViewController * Goods = [[GoodsViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:Goods];
    
    Goods.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController * v3 = [UIViewController new];
    v3.view.backgroundColor = [UIColor cyanColor];
    
    ZCMeHomeViewController * meHomeViewController = [ZCMeHomeViewController new];
    UINavigationController * meHomeNav = [[UINavigationController alloc] initWithRootViewController:meHomeViewController];
    self.viewControllers = @[nav2,v3,meHomeNav];
    
}

/**
 *  选中TabBar代理方法
 *
 *  @param tabBar tabBar
 */
- (void)ZCItemDidClicked:(ZCTabBar *)tabBar{
    
    self.selectedIndex = tabBar.currentSelected;
    
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
