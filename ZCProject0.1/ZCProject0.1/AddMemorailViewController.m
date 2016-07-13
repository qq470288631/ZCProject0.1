//
//  AddMemorailViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "AddMemorailViewController.h"

@interface AddMemorailViewController ()
@property(nonatomic, strong)UITextField *titleTextField;
@property(nonatomic, strong)UIPickerView *datePickerView;
@end

@implementation AddMemorailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.titleTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 65, self.view.frame.size.width - 20, 50)];
    self.titleTextField.backgroundColor = [UIColor whiteColor];
    self.titleTextField.placeholder = @"请输入标题";
    [self.view addSubview:_titleTextField];


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
