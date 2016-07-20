//
//  MemorailDayViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "MemorailDayViewController.h"
#import "MemorailDayTableViewCell.h"
#import "AddMemorailViewController.h"
#import "ZCMemorialDayManager.h"
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
    self.memorailTableView                                                                                                                                                                                                  = [[UITableView alloc]initWithFrame:self.view.frame];
    self.memorailTableView.delegate = self;
    self.memorailTableView.dataSource = self;
    //    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.jpg"]];
    //    [self.memorailTableView setBackgroundView:imageView];
    //    //去掉cell的下划线
    //    self.memorailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //隐藏掉多余的cell
    //     self.memorailTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_memorailTableView];
    [self.memorailTableView registerClass:[MemorailDayTableViewCell class] forCellReuseIdentifier:@"CELL"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(addMemorial:)];
    
}
-(void)addMemorial:(UITabBarItem *)sender
{
    AddMemorailViewController *addVC = [[AddMemorailViewController alloc]init];
    
    [self.navigationController pushViewController:addVC animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MemorailDayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    
    cell.titleLable.text = @"标题";
    cell.dateLable.text = @"2016-07-15";
    cell.dayLable.text = @"365天";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
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
