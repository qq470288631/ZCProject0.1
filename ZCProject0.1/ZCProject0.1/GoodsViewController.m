//
//  GoodsViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "GoodsViewController.h"
#import "GoodsRequest.h"

@interface GoodsViewController ()<UITableViewDataSource,UITableViewDelegate>


@property(strong,nonatomic)UITableView *MaintableView;

@end



@implementation GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    GoodsRequest * request = [GoodsRequest new];
    [request requestHomeList];
    
    
    _MaintableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:(UITableViewStylePlain)];
    

    [_MaintableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    
    
    
    
    _MaintableView.dataSource = self;
    
    _MaintableView.delegate = self;
    
    [self.view addSubview:_MaintableView];
    
    
    
    
    
    
    
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
    
}


//分区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
    
    
}


//给cell赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    
    cell.textLabel.text = @"诺克萨斯";
    
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
