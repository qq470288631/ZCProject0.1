//
//  CXCarouselView.h
//  pregnant-information
//
//  Created by 王长旭 on 16/2/25.
//  Copyright © 2016年 sw. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CXCarouselView;
@protocol CXCarouseViewDelegate <NSObject>

- (void) carouselTouch:(CXCarouselView*)carousel atIndex:(NSUInteger)index;

@end
@interface CXCarouselView : UIView

@property BOOL hasTimer;
@property (assign, nonatomic) NSUInteger interval;

@property (strong, nonatomic) UIImage *placeHolder;
@property (strong, nonatomic) NSArray * imageArray;
@property (strong, nonatomic) UIScrollView *wheelScrollView;
@property (strong, nonatomic) UIPageControl *wheelPageControl;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSUInteger currentImageIndex;
@property (strong, nonatomic) UIImageView *image1;
@property (strong, nonatomic) UIImageView *image2;
@property (strong, nonatomic) UIImageView *image3;
@property (assign, nonatomic) NSUInteger imageNum;
@property (strong, nonatomic) UIImageView *mask;
@property (assign, nonatomic) BOOL isLocal;

@property (weak, nonatomic) id<CXCarouseViewDelegate> delegate;

+(instancetype)initWithFrame:(CGRect)frame hasTimer:(BOOL) hastimer interval:(NSUInteger) inter placeHolder:(UIImage*) image;

-(void) setupWithArray:(NSArray *)array;
-(void) destroy;
-(void) restart;

@end