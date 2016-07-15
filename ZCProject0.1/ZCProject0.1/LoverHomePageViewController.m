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
@interface LoverHomePageViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UITableView *friendsListTableView;

@end

@implementation LoverHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.friendsListTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.friendsListTableView.dataSource = self;
    self.friendsListTableView.delegate = self;
    [self.view addSubview:_friendsListTableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemCompose) target:self action:@selector(homePageClicked:)];
    //情侣注册
    [self.friendsListTableView registerClass:[LoverTableViewCell class] forCellReuseIdentifier:@"CEll"];
    //好友注册
    [self.friendsListTableView registerClass:[FriendListTableViewCell class] forCellReuseIdentifier:@"CEll"];
    
}
//点击事件
-(void)homePageClicked:(UIBarButtonItem *)sender
{


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        LoverTableViewCell *cell = [[LoverTableViewCell alloc]init];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"14.png"]];
        cell.loverLable.text = @"情侣";
        cell.loverLable.font = [UIFont systemFontOfSize:30];
        cell.loverImage.image = [UIImage imageNamed:@"10.png"];
        return cell;
    
    }else{
        FriendListTableViewCell *cell = [[FriendListTableViewCell alloc]init];
        cell.friendsLable.text = @"好友";
        cell.friendsImage.image = [UIImage imageNamed:@"10.png"];
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
