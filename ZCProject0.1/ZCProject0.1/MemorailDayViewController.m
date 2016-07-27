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
@property(nonatomic, strong)ZCMemorialDayManager *zcManager;

@end

@implementation MemorailDayViewController
-(void)loadData
{
    
    self.zcManager = [ZCMemorialDayManager new];
    [_zcManager createMemorialDayTable];
    _dataArray = [NSMutableArray array];
   _dataArray =[_zcManager getAllMemorialDay];
    NSLog(@"%@", _dataArray);
    [self.memorailTableView reloadData];


}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self loadData];


}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.title = @"纪念日";
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = [[NSMutableArray alloc]init];
    self.memorailTableView                                                                                                                                                                                                  = [[UITableView alloc]initWithFrame:self.view.frame];
    self.memorailTableView.delegate = self;
    self.memorailTableView.dataSource = self;
    [self.view addSubview:_memorailTableView];
    [self.memorailTableView registerClass:[MemorailDayTableViewCell class] forCellReuseIdentifier:@"CELL"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(addMemorial:)];
    
}
-(void)addMemorial:(UITabBarItem *)sender
{
    AddMemorailViewController *addVC = [[AddMemorailViewController alloc]init];
    typeof(self) pSelf = self;
    addVC.myBlock = ^() {
        [pSelf loadData];
    };
    
    [self.navigationController pushViewController:addVC animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MemorailDayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    ZCMemorialDayModel *model = _dataArray[indexPath.row];
    cell.titleLable.text = model.title;
    cell.dateLable.text = model.date;
    cell.dayLable.text = model.day;
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        ZCMemorialDayModel *model = self.dataArray[indexPath.row];
        ZCMemorialDayManager *manager = [ZCMemorialDayManager new];
        [manager deleteMemorialDayWithTitle:model
         .title];
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [self.memorailTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationLeft)];
    }


}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddMemorailViewController *addVC = [[AddMemorailViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];
    ZCMemorialDayModel *model = self.dataArray[indexPath.row];
    ZCMemorialDayManager *manager = [ZCMemorialDayManager new];
    [manager updateMemorialDayWithTitle:model.title forDate:model.date andDay:model.day];
    
    
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
