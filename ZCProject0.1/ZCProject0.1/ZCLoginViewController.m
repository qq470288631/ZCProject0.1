//
//  ZCLoginViewController.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ZCLoginViewController.h"

@interface ZCLoginViewController ()

@end

@implementation ZCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self userTest];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)userTest{
    
    //    EMError *error = [[EMClient sharedClient] registerWithUsername:@"admin" password:@"admin"];
    //    if (error==nil) {
    //        NSLog(@"注册成功");
    //    }
    
    //    BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
    //    if (!isAutoLogin) {
    //        EMError *error = [[EMClient sharedClient] loginWithUsername:@"admin" password:@"admin"];
    //        if (!error)
    //        {
    //            NSLog(@"1");
    //            [[EMClient sharedClient].options setIsAutoLogin:YES];
    //        }
    //    }else{
    //        NSLog(@"2");
    //    }
    
    
    //    EMError *error1 = [[EMClient sharedClient] logout:YES];
    //    if (!error1) {
    //        NSLog(@"退出成功");
    //    }else{
    //        NSLog(@"%@",error1);
    //    }
    
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
