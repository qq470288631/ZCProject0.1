//
//  AddMemorailViewController.m
//  ZCProject0.1
//
//  Created by lanou3g on 16/7/13.
//  Copyright © 2016年 唐旭. All rights reserved.
//

#import "AddMemorailViewController.h"
#import "ZCMemorialDayManager.h"

@interface AddMemorailViewController ()<UITextFieldDelegate>
@property(nonatomic, strong)UITextField *titleTextField;
//显示天数
@property(nonatomic, strong)UILabel *dateLable;
//显示时间
@property(nonatomic, strong)UILabel *pickerDate;
//时间轴
@property(nonatomic, strong)UIDatePicker *datePickerView;
@property(nonatomic, strong)ZCMemorialDayManager *ZCMemorialDatManager;

@end

@implementation AddMemorailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"12.jpg"]];
    self.titleTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 65, self.view.frame.size.width - 20, 50)];
    _titleTextField.delegate = self;
    self.titleTextField.backgroundColor = [UIColor whiteColor];
    self.titleTextField.placeholder = @"请输入标题";
    [self.view addSubview:_titleTextField];
    _dateLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 300, self.view.frame.size.width - 20, 100)];
    _dateLable.textAlignment = 1;
    _dateLable.text = @"0天";
    _dateLable.font = [UIFont systemFontOfSize:50];
    _dateLable.textColor = [UIColor blackColor];
    [self.view addSubview:_dateLable];
    _pickerDate = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, self.view.frame.size.width - 20, 100)];
    _pickerDate.textAlignment = 1;
    _pickerDate.text = @" - - -";
    _pickerDate.font = [UIFont systemFontOfSize:50];
    _pickerDate.textColor = [UIColor blackColor];
    [self.view addSubview:_pickerDate];
    _datePickerView = [[UIDatePicker alloc]initWithFrame:CGRectMake(10, self.view.frame.size.height - 200, self.view.frame.size.width - 20, 150)];
    _datePickerView.datePickerMode = UIDatePickerModeDate;
    _datePickerView.backgroundColor = [UIColor whiteColor];
    [_datePickerView addTarget:self action:@selector(dateClicked:) forControlEvents:(UIControlEventValueChanged)];
    
    [self.view addSubview:_datePickerView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:(UIBarButtonItemStylePlain) target:self action:@selector(saveClicked:)];
   

}
-(void)saveClicked:(UIBarButtonItem *)sender
{
    self.ZCMemorialDatManager = [[ZCMemorialDayManager alloc]init];
    [_ZCMemorialDatManager createMemorialDayTable];
    [_ZCMemorialDatManager addMemorialDayWithTitle:_titleTextField.text date:_pickerDate.text day:_dateLable.text];
    self.myBlock();
    [self.navigationController popViewControllerAnimated:YES];
   
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
    _pickerDate.text = formatter.dateFormat;
}
//跟着键盘上移
-(void)textFieldDidBeginEditing:(UITextField *)textField

{
    
    CGRect frame = _titleTextField.frame;
    
    int offset = frame.origin.y + 70  - (self.view.frame.size.height - 216.0);//iPhone键盘高度216，iPad的为352
    
    
    
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    
    [UIView setAnimationDuration:0.5f];
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    
    if(offset > 0)
        
        self.view.frame = CGRectMake(0.0f, - offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_titleTextField resignFirstResponder];
    return YES;
    
    
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
