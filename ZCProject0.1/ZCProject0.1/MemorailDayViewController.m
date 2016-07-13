//
//  MemorailDayViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "MemorailDayViewController.h"
#import "AddMemorailViewController.h"
@interface MemorailDayViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UITableView *memorailTableView;
@property(nonatomic, strong)NSMutableArray *dataArray;
@end

@implementation MemorailDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"纪念日";
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = [[NSMutableArray alloc]init];
    self.memorailTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.memorailTableView.delegate = self;
    self.memorailTableView.dataSource = self;
    [self.memorailTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(addMemorial:)];
}
-(void)addMemorial:(UITabBarItem *)sender
{

    AddMemorailViewController *addVC = [[AddMemorailViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];

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
