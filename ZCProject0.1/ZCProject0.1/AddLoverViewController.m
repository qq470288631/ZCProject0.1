//
//  AddLoverViewController.m
//
//
//  Created by lanou3g on 16/7/13.
//
//

#import "AddLoverViewController.h"
//#import "AddLoverTableViewCell.h"
#import "ChatViewController.h"
#import "MapViewController.h"
#import "MemorailDayViewController.h"
#import "LoverZoneHeaderTableViewCell.h"
#import "ChatTableViewCell.h"
#import "MapTableViewCell.h"
#import "MemorailTableViewCell.h"
@interface AddLoverViewController ()<UITableViewDataSource, UITableViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>
//UIView视图
@property(nonatomic, strong)UIView *inviteView;
//视图上的图片
@property(nonatomic, strong)UIImageView *backgroundImage;

@property(nonatomic, strong)UITableView *backgroundTableView;
//访问标识
@property(nonatomic, strong)UIImageView *visiteImage;

//访问人数
@property(nonatomic, strong)UILabel *visiteLable;

@end

@implementation AddLoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"情侣空间";
    self.view.backgroundColor = [UIColor whiteColor];
    self.backgroundTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.backgroundTableView.dataSource = self;
    self.backgroundTableView.delegate = self;
//    self.backgroundTableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backgroundTableView];
    self.backgroundImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WindownWidth, 364)];
    self.backgroundImage.image = [UIImage imageNamed:@"13"];
    [self.view addSubview:_backgroundImage];
    self.visiteImage = [[UIImageView alloc]initWithFrame:CGRectMake(240, 314, 50, 50)];
    self.visiteImage.image = [UIImage imageNamed:@"eye.png"];
    [self.backgroundImage addSubview:_visiteImage];
    self.visiteLable = [[UILabel alloc]initWithFrame:CGRectMake(300, 314, 200, 50)];
    self.visiteLable.text = @"访问人数:1000";
    self.visiteLable.backgroundColor = [UIColor clearColor];
    [self.backgroundImage addSubview:_visiteLable];

    //header注册
    [self.backgroundTableView registerClass:[LoverZoneHeaderTableViewCell class] forCellReuseIdentifier:@"cell"];
    //other cell
//    [self.backgroundTableView registerClass:[AddLoverTableViewCell class] forCellReuseIdentifier:@"cell"];
    //聊天cell注册
    [self.backgroundTableView registerClass:[ChatTableViewCell class] forCellReuseIdentifier:@"cell"];
    //定位cell注册
    [self.backgroundTableView registerClass:[MapTableViewCell class] forCellReuseIdentifier:@"cell"];
    //纪念日cell注册
    [self.backgroundTableView registerClass:[MemorailTableViewCell class] forCellReuseIdentifier:@"cell"];
    //去掉cell的下划线
    self.backgroundTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

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
    
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.row == 0) {
        LoverZoneHeaderTableViewCell *cell = [[LoverZoneHeaderTableViewCell alloc]init];
        cell.backgroundColor = [UIColor colorWithPatternImage:_backgroundImage.image];
        
        return cell;
        
    }else if (indexPath.row == 1){
        ChatTableViewCell *cell = [[ChatTableViewCell alloc]init];
        cell.chatLable.text = @"聊天";
        cell.chatImage.image = [UIImage imageNamed:@"chat.png"];
        cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
        return cell;
    
    }else if (indexPath.row == 2){
        MapTableViewCell *cell = [[MapTableViewCell alloc]init];
        cell.mapLable.text = @"定位";
        cell.mapImage.image = [UIImage imageNamed:@"map.png"];
        return cell;
    
    }else if(indexPath.row == 3){
        MemorailTableViewCell *cell = [[MemorailTableViewCell alloc]init];
        cell.memorailLable.text = @"纪念日";
        cell.memorailImage.image = [UIImage imageNamed:@"memorail.png"];
        return cell;
        }
    
       return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"从相册中选取" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
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
            break;
 
        case 1:
        {
            ChatViewController *chatVC = [[ChatViewController alloc]init];
            [self.navigationController pushViewController:chatVC animated:YES];
        
        }
        break;
        case 2:
        {
            MapViewController *mapVC = [[MapViewController alloc]init];
            [self.navigationController pushViewController:mapVC animated:YES];
            
        }
            break;
        case 3:
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
    if (indexPath.row == 0) {
        return 300;
    }else
        
        return 70;
        
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
