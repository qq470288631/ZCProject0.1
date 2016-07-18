//
//  ShopingViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ShopingViewController.h"
#import "ShopTableViewCell.h"
#import "GoodsRequest.h"
#import "ShopModel.h"

static NSString *kNewInfoPath = @"http://open3.bantangapp.com/topic/newInfo?";


@interface ShopingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *ShopTableView;

@property(nonatomic,strong)NSMutableArray *mutaArray;

@end

@implementation ShopingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    self.ShopTableView.delegate = self;
    
    self.ShopTableView.dataSource = self;
    
    
    [_ShopTableView registerNib:[UINib nibWithNibName:@"ShopTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    GoodsRequest *request = [[GoodsRequest alloc]init];
    
    
    NSMutableDictionary *parameter = [self commonParameters].mutableCopy;
    
    NSInteger ID;
    
    parameter[@"id"] = @(ID);
    
   
    
    [request getRequestWithUrl:kNewInfoPath parameters:parameter successResponse:^(NSDictionary *dic) {
        
//        NSLog(@"%@",dic);
        
        ShopModel *model = [[ShopModel alloc]init];
        
        
        
        
        
        
        
        
        
        
    } failureResponse:^(NSError *error) {
        
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopTableViewCell *cell = [[ShopTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    
    return cell;
    
    
}




- (NSDictionary *)commonParameters {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    dict[@"app_id"] = @"com.jzyd.BanTang";
    dict[@"app_installtime"] = @(1462985294);
    dict[@"app_versions"] = @(5.7);
    dict[@"channel_name"] = @"appStore";
    dict[@"client_id"] = @"bt_app_ios";
    dict[@"client_secret"] = @"9c1e6634ce1c5098e056628cd66a17a5";
    dict[@"last_get_time"] = @(1463238932);
    dict[@"os_versions"] = @"9.3.1";
    dict[@"screensize"] = @(750);
    dict[@"track_device_info"] = @"iPhone8";
    dict[@"track_deviceid"] = @"476C2ABB-9058-4621-930B-158CBB91354B";
    dict[@"v"] = @(12);
    
    return dict.copy;
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
