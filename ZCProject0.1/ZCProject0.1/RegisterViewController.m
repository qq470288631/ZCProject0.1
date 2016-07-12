//
//  RegisterViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/12.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "RegisterViewController.h"
#define WindowWidth self.view.frame.size.width
#define WindowHight self.view.frame.size.height
@interface RegisterViewController ()
//注册的用户名
@property(nonatomic, strong)UITextField *userRegisterName;
//注册的密码
@property(nonatomic, strong)UITextField *userRegiisterPassword;
//注册的按钮
@property(nonatomic, strong)UIButton *registerBtn;
  @end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userRegisterName = [[UITextField alloc]initWithFrame:CGRectMake(WindowWidth - 100, WindowHight - 200, 200, 50)];
    [self.view addSubview:self.userRegisterName]; 
    self.userRegiisterPassword = [[UITextField alloc]initWithFrame:CGRectMake(WindowWidth - 100, WindowHight - 300, 200, 50)];
    [self.view addSubview:self.userRegiisterPassword];
    self.registerBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.registerBtn.frame = CGRectMake(WindowWidth - 100, WindowHight - 400, 100, 50);
    [self.registerBtn addTarget:self action:@selector(registerBtnClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.registerBtn];
}
//注册的事件
-(void)registerBtnClicked:(UIButton *)sender
{



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
