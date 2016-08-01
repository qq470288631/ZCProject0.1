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

#define Kwidth self.view.frame.size.width
#define KHeith self.view.frame.size.height

static NSString *kNewInfoPath = @"http://open3.bantangapp.com/topic/newInfo?";


@interface ShopingViewController ()<UITableViewDataSource,UITableViewDelegate,ShopTableViewCellDelegate>

@property(nonatomic,strong)UITableView *ShopTableView;

@property(nonatomic,strong)NSMutableArray *mutaArray;

@property(nonatomic,strong)NSMutableArray *picArray;

@property(nonatomic,copy)NSMutableArray *urlArray;

//@property(nonatomic,strong)UIWebView *webView;

@property(nonatomic,strong)ShopModel *shopM;

@end

@implementation ShopingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;

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
        
       
        
        NSDictionary *dict = dic[@"data"];
        
        
    
        
            for (NSDictionary *dic1 in dict[@"product"]) {
                NSLog(@"%@",dic1);
                ShopModel *model = [[ShopModel alloc]init];
                
                [model setValuesForKeysWithDictionary:dic1];
                
                [self.mutaArray addObject:model];
                
                for (NSDictionary *dic2 in model.likes_list) {
                    [self.picArray addObject:dic2[@"a"]];
                    
                }
//              NSLog(@"%@",self.picArray);

            }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [self.ShopTableView reloadData];
            
        });

        
    } failureResponse:^(NSError *error) {
        
    }];
    
    [self.view addSubview:_ShopTableView];
    
    
    
    
}

//计算文本所占大小,并返回高度
-(CGFloat)textHeight:(NSString *)test{
    
    //计算内容所占高度
    CGRect rect = [test boundingRectWithSize:CGSizeMake(Kwidth *0.8, 1000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.height;
    
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     ShopModel *str = _mutaArray[indexPath.row];
    
    //计算字符串高度
    CGFloat height = [self textHeight:str.desc];
    
    //返回字符串高度+空白区域的高度
    
    return height + 350;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mutaArray.count;
    
    
}


//给cell赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopTableViewCell *cell = [[ShopTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    
    _shopM = self.mutaArray[indexPath.row];
    
    cell.delegate = self;
    
    cell.indexPath = indexPath;
    
    //*********************
    self.ID = _shopM.ID;
    
    
    
    cell.titleLabel.text = _shopM.title;
    
    cell.descLabel.text = _shopM.desc;
    
    cell.descLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    
    cell.descLabel.numberOfLines = 0;
    
    NSString *string = _shopM.likes;
    
    cell.loveLabel.text = [NSString stringWithFormat:@"❤️%@",string];
    
    NSString *priceStr = _shopM.price;
    
    cell.priceLabel.text = [NSString stringWithFormat:@"参考价 %@元",priceStr];
    
    [cell.commentBtn setTitle:@"评论" forState:(UIControlStateNormal)];
    
    [cell.commentBtn setTitleColor:[UIColor cyanColor] forState:(UIControlStateNormal)];
    
    //自适应高度descLabel
    NSString *descStr = cell.descLabel.text;
    
    CGFloat height = [self textHeight:descStr];
    
    cell.descLabel.frame = CGRectMake(Kwidth *0.1, KHeith *0.12, Kwidth *0.8, height);
    
  
    
    for (NSDictionary * urlDic in _shopM.pic) {
        
        NSString * imagePathString = [urlDic objectForKey:@"p"];
        
        NSString *imageURLString = [NSString stringWithFormat:@"http://bt.img.17gwx.com/%@", imagePathString];
        [self.picArray addObject:imageURLString];
    }
    
    for (NSString *imaString in self.picArray) {
        
        cell.imageV.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imaString]]];
        
        
    }
    
    
    
    
    
    

    
    return cell;
    
    
}











-(void)didSelectedBuyButtonWithCellIndexPath:(NSIndexPath *)indexPath{
    
    ShopModel *shopMD = self.mutaArray[indexPath.row];
    
    WebViewController *wedVC = [[WebViewController alloc]init];
    
    [self.navigationController pushViewController:wedVC animated:YES];
    
    wedVC.jumpUrl = shopMD.url;
    
    
    
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
