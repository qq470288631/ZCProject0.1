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
#define ChatHight self.chatTableView.frame.size.height
@interface ChatViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UITableView *chatTableView;
//聊天输入框
@property(nonatomic, strong)UITextField *chatTextField;
@property(nonatomic, strong)UIButton *emojButton;
@property(nonatomic, strong)UIButton *addbutton;
@property(nonatomic, strong)UIButton *voidButton;
@property(nonatomic, strong)UIButton *keyButton;
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
    //语音
    self.voidButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.voidButton.frame = CGRectMake(0, ChatHight + 5, 40, 40);
    [self.voidButton setBackgroundImage:[UIImage imageNamed:@"void.png"] forState:(UIControlStateNormal)];
    [self.voidButton addTarget:self action:@selector(voidButtonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_voidButton];
    //输入框
    self.chatTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, ChatHight + 5, 290, 40)];
    self.chatTextField.placeholder = @"点击输入";
    [self.view addSubview:_chatTextField];
    //emoji表情
    self.emojButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.emojButton.frame = CGRectMake(330, ChatHight, 40, 40);
    [self.emojButton setBackgroundImage:[UIImage imageNamed:@"emoji.png"] forState:(UIControlStateNormal)];
    [self.emojButton addTarget:self action:@selector(emojButtonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_emojButton];
    //plus加号
    self.addbutton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.addbutton.frame = CGRectMake(370, ChatHight, 40, 40);
    [self.addbutton setBackgroundImage:[UIImage imageNamed:@"pluce.png"] forState:(UIControlStateNormal)];
    [self.addbutton addTarget:self action:@selector(addbuttonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_addbutton];
    
    
}
-(void)addbuttonClicked:(UIButton *)sender{

    

}
-(void)emojButtonClicked:(UIButton *)sender{



}
-(void)voidButtonClicked:(UIButton *)sender{



}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AddChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.headImage.image = [UIImage imageNamed:@"10.png"];
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
