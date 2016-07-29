//
//  ZCLoginViewController.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//


#import "ZCLoginViewController.h"
#import "CZRegisterViewController.h"

@interface ZCLoginViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UIActivityIndicatorView * loginActivityIndicatorView;

@property(nonatomic,strong)UIImageView * warningImageView;

@property(nonatomic,strong)UIButton * loginButton;

@property(nonatomic,strong)UITextField * usernameTextField;

@property(nonatomic,strong)UITextField * passwordTextField;


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
    usernameTextFeild.delegate = self;
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
    passwordTextFeild.delegate = self;
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
     *  登录按钮
     */
    UIButton * loginButton = [[UIButton alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(passwordTextFeild.frame) + 20, 320, 60)];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"LoginButton.png"] forState:(UIControlStateNormal)];
    
    [loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    self.loginButton = loginButton;
    [self.view addSubview:loginButton];
    
    
    /**
     *  小菊花
     */
    UIActivityIndicatorView * loginActivityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(40, 30, 0, 0)];
    loginActivityIndicatorView.backgroundColor = [UIColor redColor];
    [loginActivityIndicatorView startAnimating];
    
    self.loginActivityIndicatorView = loginActivityIndicatorView;
    
//    [loginButton addSubview:loginActivityIndicatorView];
    
    
    /**
     *  报错框
     */
    
    UIImageView * warningImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(passwordTextFeild.frame) + 20, 320, 60)];
    warningImageView.image = [UIImage imageNamed:@"Woring Message.png"];
    warningImageView.hidden = YES;
    
    self.warningImageView = warningImageView;
    [self.view addSubview:warningImageView];
    
    
    
    UIButton * registerButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(usernameTextFeild.frame) - 100, self.view.frame.size.height-70, 100, 30)];
    [registerButton setTitle:@"去注册" forState:(UIControlStateNormal)];
    [registerButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [registerButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [registerButton addTarget:self action:@selector(registerButtonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:registerButton];
    
}

- (void)registerButtonClicked:(UIButton *)sender{

    CZRegisterViewController * registerViewController = [CZRegisterViewController new];
    [self presentViewController:registerViewController animated:YES completion:^{
        
        
    }];

}


- (void)loginButtonClicked:(UIButton *)sender{

    
    if (!self.warningImageView.hidden) {
        
        [UIView transitionWithView:self.warningImageView duration:0.3 options:(UIViewAnimationOptionTransitionFlipFromBottom) animations:^{
            
            self.warningImageView.hidden = YES;
            
        } completion:nil];
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.loginButton.frame = CGRectMake(self.loginButton.frame.origin.x,
                                                self.loginButton.frame.origin.y-80,
                                                self.loginButton.frame.size.width,
                                                self.loginButton.frame.size.height);
            
        }];
    }

    [UIView animateWithDuration:0.3 animations:^{
        
        [self.loginActivityIndicatorView startAnimating];
        
    }];
    
    ZCLoginHelper * loginHelper = [ZCLoginHelper shareZCLoginHelper];
    
    BOOL result = [loginHelper loginWithUsername:self.usernameTextField.text password:self.passwordTextField.text];
    
    if (result) {
        [STTextHudTool showSuccessText:@"登录成功" withSecond:1];
        [self dismissViewControllerAnimated:YES completion:^{
            
            //存入本地
            [loginHelper setNSUserDefaultsWithUsername:self.usernameTextField.text];
            //成功回调
            [self.delegeta LoginDone];
            
        }];
        
        
    }else{
        
        [UIView transitionWithView:self.warningImageView duration:0.3 options:(UIViewAnimationOptionTransitionFlipFromBottom) animations:^{
            
            self.warningImageView.hidden = NO;
            
        } completion:nil];
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.loginButton.frame = CGRectMake(self.loginButton.frame.origin.x,
                                                self.loginButton.frame.origin.y+80,
                                                self.loginButton.frame.size.width,
                                                self.loginButton.frame.size.height);
            
        }];
        
    }
}
//跟着键盘上移
-(void)textFieldDidBeginEditing:(UITextField *)textField

{
    
    CGRect frame = _loginButton.frame;
    
    int offset = frame.origin.y + 70  - (self.view.frame.size.height - 216.0);//iPhone键盘高度216，iPad的为352
    
    
    
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    
    [UIView setAnimationDuration:0.5f];
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    
    if(offset > 0)
        
        self.view.frame = CGRectMake(0.0f, - offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
    
}
//输入框编辑完成以后，将视图恢复到原始状态

-(void)textFieldDidEndEditing:(UITextField *)textField

{
    
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_passwordTextField resignFirstResponder];
    return YES;


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
