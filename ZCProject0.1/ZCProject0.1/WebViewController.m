//
//  WebViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/22.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property(nonatomic,strong)UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.webView.scalesPageToFit = YES;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_jumpUrl]];
    
    [_webView loadRequest:request];
    
    [self.view addSubview:_webView];
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
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
