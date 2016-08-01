//
//  WheelViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/8/1.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "WheelViewController.h"

#define KWidth self.view.frame.size.width

#define KHeith self.view.frame.size.height

@interface WheelViewController ()



@end

@implementation WheelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageV = [[UIImageView alloc]init];
    
//    imageV.frame = self.view.bounds;
    imageV.frame = CGRectMake(0, 0, KWidth, KHeith * 0.3);
    
    
    [self.view addSubview:imageV];
    
    imageV.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.modelWH.pic]]];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(KWidth *0.1, KHeith *0.3 + 20, KWidth * 0.8, KHeith * 0.1)];
    
    label.text = self.modelWH.title;
    
//    label.backgroundColor = [UIColor blueColor];
    
    label.textAlignment = UITextAlignmentCenter;
    
    label.numberOfLines = 0;
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(KWidth *0.4, KHeith *0.7, KWidth *0.2, KHeith *0.2)];
    
    
    
    [btn addTarget:self action:@selector(touches) forControlEvents:(UIControlEventTouchUpInside)];
    
    [btn setTitleColor:[UIColor cyanColor] forState:(UIControlStateNormal)];
    
    [btn setTitle:@"返回" forState:(UIControlStateNormal)];
    
    [self.view addSubview:btn];
    
    [self.view addSubview:label];
    
    
    
}

-(void)touches{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

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
