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
    
    [self createView];
    
    // Do any additional setup after loading the view.
}

- (void)createView{
    
    UIImageView * backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundImageView.image = [UIImage imageNamed:@"backgroundImage.png"];
    [self.view addSubview:backgroundImageView];
    
    
    /**
     用户名文本框
     */
    UITextField * usernameTextFeild = [[UITextField alloc]initWithFrame:CGRectMake(50, 350, 320, 40)];
    usernameTextFeild.background = [UIImage imageNamed:@"textFeild.png"];
    
    //人工增加内边距
    UIView * usernamePlaceHolderPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, usernameTextFeild.bounds.size.height)];
    
    //将Padding视图添加到用户名文本框左视图
    usernameTextFeild.leftView = usernamePlaceHolderPaddingView;
    usernameTextFeild.leftViewMode = UITextFieldViewModeAlways;
    //用户标识图像
    UIImageView * userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user"]];
    userImageView.frame = CGRectMake(13, 10, 20, 20);
    
    [usernameTextFeild addSubview:userImageView];
    
    //placeholder
    usernameTextFeild.placeholder = @"请输入用户名";
    
    [self.view addSubview:usernameTextFeild];
    
    
    
    
    /**
     密码文本框
     */
    UITextField * passwordTextFeild = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(usernameTextFeild.frame)+20, 320, 40)];
    passwordTextFeild.background = [UIImage imageNamed:@"textFeild.png"];
    
    //人工增加内边距
    UIView * passwordPlaceHolderPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, passwordTextFeild.bounds.size.height)];
    
    //将Padding视图添加到用户名文本框左视图
    passwordTextFeild.leftView = passwordPlaceHolderPaddingView;
    passwordTextFeild.leftViewMode = UITextFieldViewModeAlways;
    //用户标识图像
    UIImageView * keyImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"key"]];
    keyImageView.frame = CGRectMake(12, 9, 20, 20);
    
    [passwordTextFeild addSubview:keyImageView];
    
    //placeholder
    passwordTextFeild.placeholder = @"请输入用密码";
    
    [self.view addSubview:passwordTextFeild];
    
    
    
    /**
     *  登录按钮
     */
    UIButton * loginButton = [[UIButton alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(passwordTextFeild.frame) + 40, 320, 60)];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"LoginButton.png"] forState:(UIControlStateNormal)];
    
    [self.view addSubview:loginButton];
    
    
    /**
     *  小菊花
     */
    UIActivityIndicatorView * loginActivityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(40, 30, 0, 0)];
    loginActivityIndicatorView.backgroundColor = [UIColor redColor];
    [loginActivityIndicatorView startAnimating];
    
    [loginButton addSubview:loginActivityIndicatorView];
    
    
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
