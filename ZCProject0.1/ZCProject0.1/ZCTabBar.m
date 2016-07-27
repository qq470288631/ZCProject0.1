//
//  ZCTabbar.m
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/12.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "ZCTabbar.h"

@implementation ZCTabBar

- (id)initWithItems:(NSArray *)items frame:(CGRect)frame{
    
    self = [super init];
    if (self) {
        self.frame = frame;
        for (int i=0; i<items.count; i++) {
            
            UIButton * btn = (UIButton *)items[i];
            CGFloat width = self.bounds.size.width / 3;
            CGFloat heigth = self.bounds.size.height;
            
            btn.frame = CGRectMake(i*width+20, 0, width-50, heigth-10);
            
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
            
            [self addSubview:btn];
            
        }
        
        UIButton * activityButton = items[0];
        activityButton.selected = YES;
        
        self.currentSelected = 0;
        self.currentSelectedItme = items[0];
        self.allItems = items;
        self.backgroundImage = [UIImage imageNamed:@"nav"];
        
    }
    return self;
}

- (void)btnClick:(UIButton * )sender{
    
    //获取选中按钮
    self.currentSelectedItme = sender;
    
    //获取选中按钮下标
    for (int i = 0; i<self.allItems.count; i++) {
        
        UIButton * tempBtn = self.allItems[i];
        if (tempBtn == sender) {
            
            self.currentSelected = i;
            tempBtn.selected = YES;
            
            
        }else{
            
            tempBtn.selected = NO;
            
            
        }
        
    }
    
    if (_zcDelegate) {
        [_zcDelegate ZCItemDidClicked:self];
    }
    
    
}

@end
