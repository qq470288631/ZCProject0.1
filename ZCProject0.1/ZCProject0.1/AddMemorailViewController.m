//
//  AddMemorailViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "AddMemorailViewController.h"
#import "ZCMemorialDayManager.h"
@interface AddMemorailViewController ()
@property(nonatomic, strong)UITextField *titleTextField;
//显示天数
@property(nonatomic, strong)UILabel *dateLable;
//时间轴
@property(nonatomic, strong)UIDatePicker *datePickerView;
@property(nonatomic, strong)ZCMemorialDayManager *ZCMemorialDatManager;

@end

@implementation AddMemorailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"12.png"]];
    self.titleTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 65, self.view.frame.size.width - 20, 50)];
    self.titleTextField.backgroundColor = [UIColor whiteColor];
    self.titleTextField.placeholder = @"请输入标题";
    [self.view addSubview:_titleTextField];
    _dateLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 100)];
    _dateLable.textAlignment = 1;
    _dateLable.text = @"0天";
    _dateLable.font = [UIFont systemFontOfSize:50];
    _dateLable.textColor = [UIColor blackColor];
    [self.view addSubview:_dateLable];
    _datePickerView = [[UIDatePicker alloc]initWithFrame:CGRectMake(10, self.view.frame.size.height - 200, self.view.frame.size.width - 20, 150)];
    _datePickerView.datePickerMode = UIDatePickerModeDate;
    _datePickerView.backgroundColor = [UIColor whiteColor];
    [_datePickerView addTarget:self action:@selector(dateClicked:) forControlEvents:(UIControlEventValueChanged)];
    
    [self.view addSubview:_datePickerView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:(UIBarButtonItemStylePlain) target:self action:@selector(saveClicked:)];
    

}
-(void)saveClicked:(UIBarButtonItem *)sender
{
    
    //当前时间的写入
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned units  = NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit;
    NSDateComponents *comp1 = [calendar components:units fromDate:date];
    NSInteger month = [comp1 month];
    NSInteger year = [comp1 year];
    NSInteger day = [comp1 day];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:[NSString stringWithFormat:@"%ld-%ld-%ld",year,month,day]];
    
    self.ZCMemorialDatManager = [[ZCMemorialDayManager alloc]init];
    [_ZCMemorialDatManager createMemorialDayTable];
    [_ZCMemorialDatManager addMemorialDayWithTitle:_titleTextField.text date:formatter.dateFormat];

    
   
}
-(void)dateClicked:(UIDatePicker *)picker
{
  
    
    //    当前日期为结束日期
    NSDate *date = [NSDate date];
    
    //日历类型为公历
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dayComponents = [calendar components:NSCalendarUnitDay fromDate:picker.date toDate:date options:0];
    _dateLable.text = [NSString stringWithFormat:@"%ld天",dayComponents.day];
    
    unsigned units  = NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit;
    NSDateComponents *comp1 = [calendar components:units fromDate:picker.date];
    NSInteger month = [comp1 month];
    NSInteger year = [comp1 year];
    NSInteger day = [comp1 day];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:[NSString stringWithFormat:@"%ld-%ld-%ld",year,month,day]];
    
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
