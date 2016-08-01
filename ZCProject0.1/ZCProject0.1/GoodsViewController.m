//
//  GoodsViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "GoodsViewController.h"
#import "GoodsRequest.h"
#import "ShopingViewController.h"
#import "GoodsModel.h"
#import "MainTableViewCell.h"
#import "CXCarouselView.h"
#import "WheelViewController.h"

static NSString *kHomeDataPath = @"http://open3.bantangapp.com/recommend/index?";
@interface GoodsViewController ()<UITableViewDataSource,UITableViewDelegate,CXCarouseViewDelegate>


@property(strong,nonatomic)UITableView *MaintableView;

@property(strong,nonatomic)NSMutableArray *dataArray;

@property(strong,nonatomic)CXCarouselView *carousel;

@property(strong,nonatomic)UIImageView *imageV;

@end



@implementation GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    
    self.dataArray = [[NSMutableArray alloc]init];
    
    
    __weak typeof (self)weakSelf = self;
    GoodsRequest * request = [GoodsRequest new];
   
    
    NSMutableDictionary *parameters =[self commonParameters].mutableCopy;
    parameters[@"page"] = @1;
    parameters[@"pagesize"] = @(20);
    
    [request getRequestWithUrl:kHomeDataPath parameters:parameters successResponse:^(NSDictionary *dic) {
        
         NSMutableDictionary *dataDIC = [dic objectForKey:@"data"];
        
        NSMutableArray *mutaArray = [NSMutableArray array];

        
        for (NSDictionary *dict in dataDIC[@"topic"]) {
            NSLog(@"%@",dict);
            GoodsModel *GDmodel = [[GoodsModel alloc]init];
            [GDmodel setValuesForKeysWithDictionary:dict];
            [weakSelf.dataArray addObject:GDmodel];
            
        }
        
        // 把轮播图图片的   ####  URL数组  ####  传进轮播图
        [mutaArray addObjectsFromArray:@[[weakSelf.dataArray[0] pic],
                                         [weakSelf.dataArray[1] pic],
                                         [weakSelf.dataArray[2] pic],
                                         [weakSelf.dataArray[3] pic]
                                        ]];
        
        

        // 创建轮播图
        weakSelf.carousel = [CXCarouselView initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, weakSelf.view.frame.size.height*0.3) hasTimer:YES interval:3 placeHolder:nil];
        weakSelf.carousel.delegate = weakSelf;
        weakSelf.MaintableView.tableHeaderView = weakSelf.carousel;
        // ##### 传一个放好  URL 的数组 ########
        [weakSelf.carousel setupWithArray:mutaArray];
    
        dispatch_async(dispatch_get_main_queue(), ^{
            //刷新UI
            [weakSelf.MaintableView reloadData];
            
        });
        
        
        
        
    } failureResponse:^(NSError *error) {
        
    }];
    
    
    _MaintableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:(UITableViewStylePlain)];
    

    [_MaintableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    
    
    
    
    _MaintableView.dataSource = self;
    
    _MaintableView.delegate = self;
    
    [self.view addSubview:_MaintableView];
    

    _carousel.delegate = self;
    

    
        
   }


- (void) carouselTouch:(CXCarouselView*)carousel atIndex:(NSUInteger)index{
    NSLog(@"%ld",index);
    
    WheelViewController *wheelVC = [[WheelViewController alloc]init];
    
    wheelVC.modelWH = self.dataArray[index];
    
    [self.navigationController presentViewController:wheelVC animated:YES completion:^{
        
    }];

    
    
    
    
    
    
    
}



//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 250;
    
}

//分区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
    
    
}


//给cell赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell *cell = [[MainTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    
    GoodsModel *model = [[GoodsModel alloc]init];
    
    
    
    model = [self.dataArray objectAtIndex:indexPath.row];
    
    
    

    
    
    
    
    
    
    cell.explaLabel.text = model.title;
    
    NSString *str = model.likes;
    
    cell.loveLabel.text = [NSString stringWithFormat:@"❤️%@",str];
    
    cell.ComImageV.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.pic]]];
    
    
    
    return cell;
    
    
    
    
}








//点击cell跳转页面

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShopingViewController *shopingVC = [[ShopingViewController alloc]init];
    
    GoodsModel *medol = self.dataArray[indexPath.row];
    
    
    shopingVC.ID = medol.Id;
    
    shopingVC.imageName = medol.pic;
    
    [self.navigationController pushViewController:shopingVC animated:YES];
    
    
    
}



















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
