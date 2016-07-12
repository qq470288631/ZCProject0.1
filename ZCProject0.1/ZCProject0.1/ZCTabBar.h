//
//  ZCTabbar.h
//  ZCProject0.1
//
//  Created by 唐旭 on 16/7/12.
//  Copyright © 2016年 唐旭. All rights reserved.
//

@class ZCTabBar;

@protocol ZCDelegate

- (void)ZCItemDidClicked:(ZCTabBar *)tabBar;

@end

#import <UIKit/UIKit.h>

@interface ZCTabBar : UITabBar

/**
 *  当前选中TabBar
 */
@property(nonatomic,assign)int currentSelected;

/**
 *  当前选中的Button
 */
@property(nonatomic,strong)UIButton * currentSelectedItme;

/**
 *  所有的itme
 */
@property(nonatomic,strong)NSArray * allItems;

/**
 *  代理
 */
@property(nonatomic,weak)id<ZCDelegate> zcDelegate;


/**
 *  初始化方法
 *
 *  @param items 所有BarButton
 */
- (id)initWithItems:(NSArray *)items frame:(CGRect)frame;

@end
