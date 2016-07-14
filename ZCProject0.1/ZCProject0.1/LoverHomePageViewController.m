//
//  LoverHomePageViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "LoverHomePageViewController.h"

@interface LoverHomePageViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UITableView *friendsListTableView;

@end

@implementation LoverHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.friendsListTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.friendsListTableView.backgroundColor = [UIColor orangeColor];
    self.friendsListTableView.dataSource = self;
    self.friendsListTableView.delegate = self;
    [self.view addSubview:_friendsListTableView];
    
    [self.friendsListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CEll"];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CEll"];
    return cell;
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
