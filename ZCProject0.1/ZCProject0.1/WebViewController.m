//
//  WebViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/22.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property(nonatomic,strong)UIWebView *webVC;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webVC = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.webVC.scalesPageToFit = YES;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_jumpUrl]];
    
    [_webVC loadRequest:request];
    
    
    
    
    
    [self.view addSubview:self.webVC];
    
    
    
    
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
