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
#import "WebViewController.h"

static NSString *kNewInfoPath = @"http://open3.bantangapp.com/topic/newInfo?";


@interface ShopingViewController ()<UITableViewDataSource,UITableViewDelegate,ShopTableViewCelldelegate>

@property(nonatomic,strong)UITableView *ShopTableView;

@property(nonatomic,strong)NSMutableArray *mutaArray;

@property(nonatomic,strong)NSMutableArray *picArray;

@property(nonatomic,copy)NSString *url;




@end

@implementation ShopingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.ShopTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:(UITableViewStylePlain)];
    
    
    
    self.ShopTableView.delegate = self;
    
    self.ShopTableView.dataSource = self;
    
    
    [_ShopTableView registerNib:[UINib nibWithNibName:@"ShopTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    GoodsRequest *request = [[GoodsRequest alloc]init];
    
    
    NSMutableDictionary *parameter = [self commonParameters].mutableCopy;
    

    
    parameter[@"id"] = self.ID;
    
    self.mutaArray = [NSMutableArray array];
    self.picArray = [NSMutableArray array];
    [request getRequestWithUrl:kNewInfoPath parameters:parameter successResponse:^(NSDictionary *dic) {
        
        NSLog(@"%@",dic);
        
        NSDictionary *dict = dic[@"data"];
        
        
    
        
            for (NSDictionary *dic1 in dict[@"product"]) {
                NSLog(@"%@",dic1);
                ShopModel *model = [[ShopModel alloc]init];
                
                [model setValuesForKeysWithDictionary:dic1];
                
                [self.mutaArray addObject:model];
                
                for (NSDictionary *dic2 in model.likes_list) {
                    [self.picArray addObject:dic2[@"a"]];
                    
                }
              NSLog(@"%@",self.picArray);

            }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [self.ShopTableView reloadData];
            
        });

        
    } failureResponse:^(NSError *error) {
        
    }];
    
    [self.view addSubview:_ShopTableView];
    
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 500;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mutaArray.count;
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopTableViewCell *cell = [[ShopTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    
    
    cell.delegate = self;
    
    cell.indexPath = indexPath;
    
    
    
    
    
    ShopModel *shopM = self.mutaArray[indexPath.row];
    
    self.url = shopM.url;
    self.ID = shopM.ID;
    cell.titleLabel.text = shopM.title;
    
    cell.descLabel.text = shopM.desc;
    
    cell.descLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    
    cell.descLabel.numberOfLines = 0;
    
    NSString *string = shopM.likes;
    
    cell.loveLabel.text = [NSString stringWithFormat:@"❤️%@",string];
    
    NSString *priceStr = shopM.price;
    
    cell.priceLabel.text = [NSString stringWithFormat:@"参考价 %@元",priceStr];
    
    [cell.commentBtn setTitle:@"评论" forState:(UIControlStateNormal)];
    
    [cell.commentBtn setTitleColor:[UIColor cyanColor] forState:(UIControlStateNormal)];
    
    
    
    
    [cell.purBtn setTitle:@"购买" forState:(UIControlStateNormal)];
    
    [cell.purBtn setTitleColor:[UIColor cyanColor] forState:(UIControlStateNormal)];
    
   
    
    
    
    
    
    
    //属性传值过来的照片,从上一个页面用属性传值传过来
    
    for (NSDictionary * urlDic in shopM.pic) {
        
        NSString * imagePathString = [urlDic objectForKey:@"p"];
        
        NSString *imageURLString = [NSString stringWithFormat:@"http://bt.img.17gwx.com/%@", imagePathString];
        [self.picArray addObject:imageURLString];
    }
    
    for (NSString *imaString in self.picArray) {
        
        cell.imageV.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imaString]]];
        
        
    }
    
    
    
    
    
    

    
    return cell;
    
    
}

-(void)dlickpurBtn:(NSIndexPath *)indexPath{
    
    ShopModel *shopMD = self.mutaArray[indexPath.row];
    
    WebViewController *webVC = [[WebViewController alloc]init];
    
    [self.navigationController pushViewController:webVC animated:YES];
    
    webVC.jumpUrl = shopMD.url;
    
    
    
    
    
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
