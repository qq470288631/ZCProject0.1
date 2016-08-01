//
//  LoverHomePageViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "LoverHomePageViewController.h"
#import "FriendListTableViewCell.h"
#import "LoverTableViewCell.h"
#import "AddLoverViewController.h"
#import "ChatViewController.h"
@interface LoverHomePageViewController ()<UITableViewDataSource, UITableViewDelegate,EMContactManagerDelegate,UIAlertViewDelegate>
//添加我好友的人的名字
@property(nonatomic,copy) NSString * friendName;
@property(nonatomic, strong)UITableView *friendsListTableView;
@property(nonatomic, strong)NSMutableArray *friendListArray;

@end

@implementation LoverHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.friendsListTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.friendsListTableView.dataSource = self;
    self.friendsListTableView.delegate = self;
    [self.view addSubview:_friendsListTableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(homePageClicked:)];
    //情侣注册
    [self.friendsListTableView registerClass:[LoverTableViewCell class] forCellReuseIdentifier:@"CEll"];
    //好友注册
    [self.friendsListTableView registerClass:[FriendListTableViewCell class] forCellReuseIdentifier:@"CEll"];
    _friendListArray = [NSMutableArray array];
    [[EMClient sharedClient].contactManager addDelegate:self delegateQueue:nil];
    [self getFriendsList];
    
}
-(void)getFriendsList
{
    [self.friendListArray removeAllObjects];
    EMError *error = nil;
    NSArray *userlist = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
    
    if (!error) {
        NSLog(@"获取成功 -- %@",userlist);
        for (NSString *username in userlist) {
            [self.friendListArray addObject:username];
        }
        [self.friendsListTableView reloadData];
    }

    
    
}
//点击事件
-(void)homePageClicked:(UIBarButtonItem *)sender
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"添加好友" message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
    // 取消
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [controller addAction:cancleAction];
    // 添加
    UIAlertAction *doAction = [UIAlertAction actionWithTitle:@"添加" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        //
        NSString *friendUser = controller.textFields[0].text;
        // 添加好友
        [[EMClient sharedClient].contactManager asyncAddContact:friendUser message:@"== 居然不加我" success:^{
            NSLog(@"添加成功");
            
        } failure:^(EMError *aError) {
            
        }];
    }];
    [controller addAction:doAction];
    // textfield
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    [self presentViewController:controller animated:YES completion:nil];
    
    
    
    

    
    
    

}
//用户同意添加我好友之后的回调
- (void)didReceiveAgreedFromUsername:(NSString *)aUsername
{
    NSLog(@"%@同意添加我为好友", aUsername);
    [self getFriendsList];
}
//用户拒绝添加我好友之后的回调
- (void)didReceiveDeclinedFromUsername:(NSString *)aUsername
{
    NSLog(@"%@拒绝了我，>_<", aUsername);
}

//当别人添加我为好友的时候，执行的回调方法
- (void)didReceiveFriendInvitationFromUsername:(NSString *)aUsername                                       message:(NSString *)aMessage
{
    self.friendName = aUsername;
    NSLog(@"%@添加我为好友，提示信息是：%@", aUsername,aMessage);
    NSString *message = [NSString stringWithFormat:@"%@添加我为好友，提示信息是：%@", aUsername, aMessage];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"好友请求" message:message delegate:self cancelButtonTitle:@"拒绝" otherButtonTitles:@"同意", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        //拒绝
        EMError *error1 = [[EMClient sharedClient].contactManager declineInvitationForUsername:self.friendName];
        if (!error1) {
            NSLog(@"发送拒绝成功");
        }
    }
    else if (buttonIndex == 1) {
        //同意
        EMError *error = [[EMClient sharedClient].contactManager acceptInvitationForUsername:self.friendName];
        if (!error) {
            NSLog(@"发送同意成功");
        }
    }
}

//删除好友
- (void)deleteFriendWithUsername:(NSString *)username
{
    // 删除好友
    EMError *error = [[EMClient sharedClient].contactManager deleteContact:username];
    if (!error) {
        NSLog(@"删除成功");
    }
    [self getFriendsList];
}

//把好友加入黑名单（比较狠）
- (void)addFriendToBlacklistWithUsername:(NSString *)username
{
    //	将6001加入黑名单
    EMError *error = [[EMClient sharedClient].contactManager addUserToBlackList:username relationshipBoth:YES];
    if (!error) {
        NSLog(@"加入黑名单请求发送成功");
    }
    //加完黑名单之后重新请求好友列表
    [self getFriendsList];
}

//移除黑名单
- (void)removeBlacklistWithUsername:(NSString *)username
{
    // 将6001移除黑名单
    EMError *error = [[EMClient sharedClient].contactManager removeUserFromBlackList:@"6001"];
    if (!error) {
        NSLog(@"移除黑名单请求发送成功");
    }
    [self getFriendsList];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else {
        return _friendListArray.count;
    
    }
   
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        LoverTableViewCell *cell = [[LoverTableViewCell alloc]init];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"14.jpg"]];
        cell.loverLable.text = @"情侣";
        cell.loverLable.font = [UIFont systemFontOfSize:30];
        cell.loverImage.image = [UIImage imageNamed:@"10.jpg"];
        return cell;
    
    }else{
        FriendListTableViewCell *cell = [[FriendListTableViewCell alloc]init];
        cell.friendsLable.text = _friendListArray[indexPath.row];
        cell.friendsImage.image = [UIImage imageNamed:@"10.jpg"];
        return cell;
    
    }
    
    
    
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 200;
        
    }

    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        AddLoverViewController *loverVC = [[AddLoverViewController alloc]init];
        [self.navigationController pushViewController:loverVC animated:YES];
    }else{
        ChatViewController *chatVC = [[ChatViewController alloc]init];
        [self.navigationController pushViewController:chatVC animated:YES];
    
    
    }



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
