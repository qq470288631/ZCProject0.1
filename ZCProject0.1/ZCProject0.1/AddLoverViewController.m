//
//  AddLoverViewController.m
//
//
//  Created by lanou3g on 16/7/13.
//
//

#import "AddLoverViewController.h"
#import "AddLoverTableViewCell.h"
#import "ChatViewController.h"
#import "MapViewController.h"
#import "MemorailDayViewController.h"
@interface AddLoverViewController ()<UITableViewDataSource, UITableViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>
//UIView视图
@property(nonatomic, strong)UIView *inviteView;
//视图上的图片
@property(nonatomic, strong)UIImageView *backgroundImage;

@property(nonatomic, strong)UITableView *backgroundTableView;
@end

@implementation AddLoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"情侣空间";
    self.backgroundTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.backgroundTableView.dataSource = self;
    self.backgroundTableView.delegate = self;
    self.backgroundTableView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backgroundTableView];
    self.inviteView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    self.inviteView.backgroundColor = [UIColor grayColor];
    self.backgroundImage = [[UIImageView alloc]initWithFrame:self.inviteView.frame];
    self.inviteView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]];
    [self.inviteView addSubview:_backgroundImage];
    self.backgroundTableView .tableHeaderView = self.inviteView;
    //给背景图添加轻拍手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doImageAddTap)];
    //允许用户交互
    self.backgroundImage.userInteractionEnabled = YES;
    [self.backgroundImage addGestureRecognizer:tap];
    
    [self.backgroundTableView registerClass:[AddLoverTableViewCell class] forCellReuseIdentifier:@"cell"];
    //去掉cell的下划线
    self.backgroundTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
//点击图片进入相册
-(void)doImageAddTap
{   UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"从相册中选取" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"好的" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        //设置图片来源
        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        //进入系统相册
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [alertController addAction:action2];
    [alertController addAction:action1];
    [self presentViewController:alertController animated:YES completion:nil];

}
//实现代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    //选取裁剪后的图片
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
   _backgroundImage.image = image;
    


}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AddLoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.clickedLable.text = @"聊天";
            break;
        case 1:
            cell.clickedLable.text = @"定位";
            break;
        case 2:
            cell.clickedLable.text = @"纪念日";
            break;

        default:
            break;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            ChatViewController *chatVC = [[ChatViewController alloc]init];
            [self.navigationController pushViewController:chatVC animated:YES];
        
        }
        break;
        case 1:
        {
            MapViewController *mapVC = [[MapViewController alloc]init];
            [self.navigationController pushViewController:mapVC animated:YES];
            
        }
            break;
        case 2:
        {
            MemorailDayViewController *memorailVC = [[MemorailDayViewController alloc]init];
            [self.navigationController pushViewController:memorailVC animated:YES];
            
        }
            break;

        default:
            break;
    }


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
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
