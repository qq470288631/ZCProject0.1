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
@interface ChatViewController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    UITextField *chatTextField;
    UIView *inputView;
    UIButton *rightBtn;
    UITableView *tableViews;
    
    int _count;
    NSMutableArray *_datasArray;
}

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _datasArray = [NSMutableArray array];//这里一定要记得初始化
    
    self.title = @"气泡聊天";
    self.view.backgroundColor = [UIColor whiteColor];
    
    tableViews = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WindownWidth, WindowHeight-60) style:UITableViewStylePlain];
    tableViews.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"11.png"]];
    tableViews.delegate = self;
    tableViews.dataSource = self;
    tableViews.tableFooterView = [[UIView alloc]init];
    tableViews.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableViews];
    
    
    inputView = [[UIView alloc]initWithFrame:CGRectMake(0,WindowHeight - 50, WindownWidth, 60)];
    inputView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:inputView];
    
    chatTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 3, WindownWidth - 60, 50)];
    chatTextField.borderStyle =  UITextBorderStyleRoundedRect;
    chatTextField.delegate = self;
    chatTextField.returnKeyType = UIReturnKeyDefault;
    [inputView addSubview:chatTextField];
    
    rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(WindownWidth - 50-5, 3, WindownWidth - chatTextField.frame.size.width, 50);
    rightBtn.backgroundColor = [UIColor grayColor];
    [rightBtn setTitle:@"发送" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:rightBtn];
    
    //增加监听，当键盘改变是发出消息
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    //增加监听，当键盘退出时发出消息
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}


-(void)btnClick:(id)sender
{
    _count ++;//这里声明一个int类型的变量是为了下面区分是否是自己
    
    //这里使用model，会很方便，单独作为对象来使用，方便进行设置
    MessageObj *objets = [[MessageObj alloc]init];
    objets.message = chatTextField.text;
    
    if (objets.message != nil && [objets.message isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"不能为空" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }else
    {
        //这里通过第一个发送的顺序，设为自己，其他为别人，然后绑定一个bool值的状态，yes为自己，no为别人
        if (_count % 2 == 1) {
            objets.isMe = YES;
        }else
        {
            objets.isMe = NO;
        }
        
        [_datasArray addObject:objets];
        [tableViews reloadData];
        
        //让表的最后一行滚动到表的底部
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_datasArray.count - 1 inSection:0];
        [tableViews scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        
        chatTextField.text = nil;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datasArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageObj *object = _datasArray[indexPath.row];
    
    CGFloat contentW = WindownWidth - 34;
    
    UIFont *fnt = [UIFont fontWithName:@"HelveticaNeue" size:18.0f];
    
    //ios 7 以后的方法，这里得到自适应的高度，从而动态的设置cell的高度
    CGRect tempRect = [object.message boundingRectWithSize:CGSizeMake(contentW, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil] context:nil];
    CGFloat contenH = tempRect.size.height;
    
    return contenH + 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifiers = @"CELLES";
    AddChatTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        
        cell = [[AddChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifiers];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    
    MessageObj *object = _datasArray[indexPath.row];
    
    //在这里进行宽度和高度的自适应
    UIFont *fnt = [UIFont fontWithName:@"HelveticaNeue" size:18.0f];
    CGSize size = CGSizeMake(WindownWidth,1000);
    CGSize labSize = [object.message sizeWithFont:fnt constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
    
    
    if (object.isMe == YES) {
        
        cell.messageLab.frame = CGRectMake(20, 0, labSize.width, labSize.height);
        cell.messageLab.textAlignment = NSTextAlignmentLeft;
        cell.messageLab.numberOfLines = 0;
        cell.messageImg.frame = CGRectMake(10, 0, labSize.width + 20, labSize.height + 10);
    }else{
        cell.messageLab.frame = CGRectMake(WindownWidth - 20 - labSize.width, 5, labSize.width, labSize.height);
        cell.messageLab.numberOfLines = 0;
        cell.messageLab.textAlignment = NSTextAlignmentRight;
        cell.messageImg.frame = CGRectMake(WindownWidth - 30 - labSize.width, 2, labSize.width + 20, labSize.height + 10);
    }
    
    NSString *imageName = object.isMe?@"bubble.png":@"bubbleSelf.png";
    UIImage *oldImage = [UIImage imageNamed:imageName];
    UIImage *newImage = [oldImage stretchableImageWithLeftCapWidth:18 topCapHeight:8];
    cell.messageImg.image = newImage;
    cell.messageLab.font = fnt;
    cell.messageLab.text = object.message;
    
    return  cell;
    
}

-(void)keyboardWillShow:(NSNotification *)Notification
{
    //获取键盘的高度
    NSDictionary *userInfo = [Notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;//获取到的键盘的高度
    [UIView animateWithDuration:0.1 animations:^{
        CGRect tableFrame = tableViews.frame;
        tableFrame.size.height = WindowHeight - height - 60;
        tableViews.frame = tableFrame;
        CGRect rect = inputView.frame;
        rect.origin.y = WindowHeight - height - 60;
        inputView.frame = rect;
    }];
    
}

-(void)keyboardWillHide:(NSNotification *)hNotification
{
    [UIView animateWithDuration:0.1 animations:^{
        CGRect tableViewRect = tableViews.frame;
        tableViewRect.size.height = WindowHeight- 60;
        tableViews.frame = tableViewRect;
        CGRect rect = inputView.frame;
        rect.origin.y = WindowHeight - 60;
        inputView.frame = rect;
    }];
    
    if (_datasArray.count > 0)
    {
        //让表的最后一行滚动到表的底部
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_datasArray.count-1 inSection:0];
        [tableViews scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [chatTextField resignFirstResponder];
    return YES;
}
//textField的边框设置
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    chatTextField.layer.borderColor = [[UIColor grayColor]CGColor];
    chatTextField.layer.borderWidth = 2.0f;
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
