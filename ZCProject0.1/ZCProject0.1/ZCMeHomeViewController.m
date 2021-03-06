//
//  ZCMeHomeViewController.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/19.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ZCMeHomeViewController.h"
#import "ZCTopTableViewCell.h"
#import "ZCNoMessageTableViewCell.h"

@interface ZCMeHomeViewController ()<ZCLoginViewControllerDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)UITableView * tableView;

@property(nonatomic,strong)UIImageView * userImageView;

@end

@implementation ZCMeHomeViewController

-(void)LoginDone{
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    ProvingLoginStatus * proving = [ProvingLoginStatus shareProvingLoginStatus];
    
    
    if ([proving checkoutLoginStatus]) {
        
    }else{
        [proving checkoutLoginStatusShowLoginViewONController:self];
    }
    
//    [[EMClient sharedClient].options setIsAutoLogin:NO];
    
    [self createView];

}

- (void)createView{
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(-10, -50, 94, 94)];
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.layer.cornerRadius = 47;  // 将图层的边框设置为圆脚 （值为对象宽一半为圆形）
    imageView.layer.masksToBounds = YES; // 隐藏边界
    imageView.layer.anchorPoint = CGPointMake(0.25, 0);//锚点为原点
    imageView.layer.borderWidth = 1;  // 给图层添加一个有色边框
    imageView.layer.borderColor = [UIColor whiteColor].CGColor;   //边框颜色
    imageView.image = [UIImage imageNamed:@"icon-cat-reload@2x.png"];
    
    self.userImageView = imageView;
    
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    [self.navigationController.navigationBar addSubview:imageView];
    
    UILabel * titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(WindownWidth/2 - 50, 0, 100, 40);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"TANGXU";
    titleLabel.textColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = titleLabel;
    
    
    
    UIButton * toolsButton = [[UIButton alloc]initWithFrame:CGRectMake(WindownWidth-50, 10, 25, 25)];
    [toolsButton setBackgroundImage:[UIImage imageNamed:@"tools.png"] forState:(UIControlStateNormal)];
    [self.navigationController.navigationBar addSubview:toolsButton];
    
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:(UITableViewStylePlain)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[ZCTopTableViewCell class] forCellReuseIdentifier:@"cellID"];
    [tableView registerClass:[ZCNoMessageTableViewCell class] forCellReuseIdentifier:@"cellID1"];
    self.tableView = tableView;
    [self.view addSubview:tableView];

    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            ZCTopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
            return cell;
            break;
        }
        case 1:{
            ZCNoMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID1"];
            return cell;
            break;
        }
        default:
            break;
    }
    ZCTopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat size = scrollView.contentOffset.y + 64;
    NSLog(@"size =   %f",size);
    if (size < 200) {
        
        CGFloat scaleSize = 1 - size/400;
        NSLog(@"scaleSize =  %f",scaleSize);
        CGAffineTransform newTransform = CGAffineTransformScale(CGAffineTransformIdentity, scaleSize ,scaleSize);
        [self.userImageView setTransform:newTransform];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            return 360;
            break;
    
        case 1:
            return 200;
            break;
            
        default:
            break;
    }
    
    return 500;
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
