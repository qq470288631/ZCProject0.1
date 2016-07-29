//
//  ChatViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ChatViewController.h"
#import "MessageObj.h"
#import "AddChatTableViewCell.h"
#import "ZCMessageHelper.h"
#define ChatHight self.chatTableView.frame.size.height
@interface ChatViewController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property(nonatomic, strong)UITableView *chatTableView;
//聊天输入框
@property(nonatomic, strong)UITextField *chatTextField;
@property(nonatomic, strong)UIButton *sendButton;
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.chatTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WindownWidth, WindowHeight - 50)];
    self.chatTableView.dataSource = self;
    self.chatTableView.delegate = self;
    self.chatTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, self.chatTableView.frame.size.height, WindownWidth, 60)];
    [self.view addSubview:_chatTableView];
    [self.chatTableView registerClass:[AddChatTableViewCell class] forCellReuseIdentifier:@"cell"];
    //输入框
    self.chatTextField = [[UITextField alloc]initWithFrame:CGRectMake(5, ChatHight - 44, 340, 40)];
    self.chatTextField.backgroundColor = [UIColor whiteColor];
    self.chatTextField.placeholder = @"点击输入";
    self.chatTextField.delegate = self;
    [self.view addSubview:_chatTextField];
    _sendButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _sendButton.frame = CGRectMake(340, ChatHight - 44, self.view.frame.size.width - 5 - 340, 40);
    _sendButton.backgroundColor = [UIColor blueColor];
    [_sendButton setTitle:@"发送" forState:(UIControlStateNormal)];
    [_sendButton addTarget:self action:@selector(sendAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_sendButton];
     _chatTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    
}
//发送
-(void)sendAction:(UIButton *)sender
{
    if (self.chatTextField.text.length > 0) {
        ZCMessageHelper *msgHelper = [[ZCMessageHelper alloc]init];
//        [msgHelper sendTextMessageWithMessage:<#(NSString *)#> To:<#(NSString *)#>]
       
    }


}
//跟着键盘上移
-(void)textFieldDidBeginEditing:(UITextField *)textField

{
    
    CGRect frame = textField.frame;
    
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AddChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.headImage.image = [UIImage imageNamed:@"10.jpg"];
    cell.messageLable.text = @"sdasds";
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
