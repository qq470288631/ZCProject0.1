//
//  LoginViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/12.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "LoginViewController.h"
#define WindowWidth self.view.frame.size.width
#define WindowHight self.view.frame.size.height
@interface LoginViewController ()
//用户名
@property(nonatomic, strong)UITextField *userLoginName;
//密码
@property(nonatomic, strong)UITextField *userLoginPassword;
//登录按钮
@property(nonatomic, strong)UIButton *loginButton;
//注册按钮
@property(nonatomic, strong)UIButton *registerButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //用户名
    self.userLoginName = [[UITextField alloc]initWithFrame:CGRectMake(WindownWidth - 325, 200, 250, 40)];
    self.userLoginName.placeholder = @"请输入账号";
    [self.view addSubview:self.userLoginName];
    //密码
    self.userLoginPassword = [[UITextField alloc]initWithFrame:CGRectMake(WindowWidth - 325, 250, 250, 40)];
    self.userLoginPassword.placeholder = @"请输入密码";
    [self.view addSubview:self.userLoginPassword];
    //登录按钮
    self.loginButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _loginButton.frame = CGRectMake(WindowWidth - 325, WindowHight - 400, 50, 40);
    _loginButton.backgroundColor = [UIColor blueColor];
    [_loginButton addTarget:self action:@selector(loginClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_loginButton];
    //注册按钮
    self.registerButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _registerButton.frame = CGRectMake(WindowWidth - 250, WindowHight - 400, 100, 50);
    _registerButton.backgroundColor = [UIColor blueColor];
    [_registerButton addTarget:self action:@selector(registerClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_registerButton];
    
}
//登陆点击事件
-(void)loginClicked:(UIButton *)sender{
    
    
    
}
//注册点击事件
-(void)registerClicked:(UIButton *)sender{
    
    
    
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
