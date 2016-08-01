//
//  WheelViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/8/1.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "WheelViewController.h"

@interface WheelViewController ()



@end

@implementation WheelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageV = [[UIImageView alloc]init];
    
    imageV.frame = self.view.bounds;
    
    [self.view addSubview:imageV];
    
    imageV.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.modelWH.pic]]];
    
    
    
    
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
