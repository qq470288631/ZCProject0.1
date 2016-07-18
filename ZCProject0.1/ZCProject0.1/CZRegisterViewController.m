//
//  CZRegisterViewController.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "CZRegisterViewController.h"

@interface CZRegisterViewController ()



@end

@implementation CZRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    self.usernameTextField = usernameTextFeild;
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
    
    self.passwordTextField = passwordTextFeild;
    [self.view addSubview:passwordTextFeild];
    
    /**
     密码文本框
     */
    UITextField * aginPasswordTextFeild = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(passwordTextFeild.frame)+20, 320, 40)];
    aginPasswordTextFeild.background = [UIImage imageNamed:@"textFeild.png"];
    
    //人工增加内边距
    UIView * aginPasswordPlaceHolderPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, aginPasswordTextFeild.bounds.size.height)];
    
    //将Padding视图添加到用户名文本框左视图
    aginPasswordTextFeild.leftView = aginPasswordPlaceHolderPaddingView;
    aginPasswordTextFeild.leftViewMode = UITextFieldViewModeAlways;
    //用户标识图像
    UIImageView * aginKeyImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"key"]];
    aginKeyImageView.frame = CGRectMake(12, 9, 20, 20);
    [aginPasswordTextFeild addSubview:aginKeyImageView];
    
    //placeholder
    aginPasswordTextFeild.placeholder = @"请再次输入用密码";
    
//    self.passwordTextField = aginPasswordTextFeild;
    [self.view addSubview:aginPasswordTextFeild];
    
    
    /**
     *  注册按钮
     */
    UIButton * registerButton = [[UIButton alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(aginPasswordTextFeild.frame) + 20, 320, 60)];
    [registerButton setBackgroundImage:[UIImage imageNamed:@"RegisterButton.png"] forState:(UIControlStateNormal)];
    
//    [registerButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
//    self.loginButton = loginButton;
    [self.view addSubview:registerButton];
    
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
