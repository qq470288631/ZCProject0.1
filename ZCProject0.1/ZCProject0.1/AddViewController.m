//
//  AddViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/28.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
@property(strong,nonatomic)UITextField *textfiled;
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textfiled = [[UITextField alloc]init];
    _textfiled.frame = CGRectMake(20, 110, 150, 40);
    _textfiled.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_textfiled];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor greenColor];
    button.frame = CGRectMake(180, 110, 80, 40);
    [button addTarget:self action:@selector(addBtnAC:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"添加" forState:UIControlStateNormal];
    [self.view addSubview:button];
}
-(void)addBtnAC:(UIButton *)sender{

    EMError *error = [[EMClient sharedClient].contactManager addContact:self.textfiled.text message:@"我想加您为好友"];
    if (!error) {
        NSLog(@"添加成功");
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
