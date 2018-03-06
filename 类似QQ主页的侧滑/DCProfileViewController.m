//
//  DCProfileViewController.m
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/6/1.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "DCProfileViewController.h"
#import "DCGroup.h"
#import "DCWeChatCellModel.h"
#import "DCCellArrowModel.h"
#import "DCCellSwitchModel.h"

#import "DCSettingViewController.h"
@interface DCProfileViewController ()

@property(strong,nonatomic)NSMutableArray *groupDatas;

@end

@implementation DCProfileViewController

-(NSMutableArray *)groupDatas
{
    if (!_groupDatas) {
        
        _groupDatas = [NSMutableArray array];
    }
    return _groupDatas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    // 每组之间的间距
    self.tableView.sectionHeaderHeight = 1.0;

    [self setupGroups];
}
-(void)setupGroups
{
    [self setupGroup0];
    [self setupGroup2];
    [self setupGroup1];
    [self setupGroup3];
}
-(void)setupGroup0
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headerView;
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, self.view.width, 100)];
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(clickImageBtn:) forControlEvents:UIControlEventTouchDown];
    [headerView addSubview:btn];
    //    self.tableView.tableHeaderView = btn;
    
    CGFloat margin = 10;
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"boy.jpg"]];
    imageView1.x = margin;
    imageView1.y = margin;
    imageView1.height = btn.height - margin *2;
    imageView1.width = imageView1.height;
    [btn addSubview:imageView1];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"牵着小狗看夕阳";
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.x = CGRectGetMaxX(imageView1.frame) + margin;
    nameLabel.y = imageView1.height /2;
    nameLabel.width = 200;
    nameLabel.height = 30;
    [btn addSubview:nameLabel];
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"me_wm"]];
    imageView2.height = 30;
    imageView2.width = imageView2.height;
    imageView2.x = btn.width - (margin *2 + imageView2.width);
    //    imageView2.y = (btn.height - imageView2.height) / 2;
    imageView2.y = nameLabel.y;
    [btn addSubview:imageView2];
    
}

-(void)setupGroup1
{
    DCGroup *group = [[DCGroup alloc]init];
    [self.groupDatas addObject:group];
    DCWeChatCellModel *cell0 = [DCCellSwitchModel cellWithIcon:@"me_collect" title:@"收藏" destVC:nil];
    DCWeChatCellModel *cell1 = [DCCellArrowModel cellWithIcon:@"me_photo" title:@"相册" destVC:nil];
    cell1.subTitle = @"subTitle";
    DCWeChatCellModel *cell2 = [DCCellArrowModel cellWithIcon:@"me_smail" title:@"表情" destVC:nil];
    
    group.cells = @[cell0,cell1,cell2];
}

-(void)setupGroup2
{
    DCGroup *group = [[DCGroup alloc]init];
    [self.groupDatas addObject:group];
    DCWeChatCellModel *cell0 = [DCCellArrowModel cellWithIcon:@"me_money" title:@"钱包" destVC:nil];
    group.cells = @[cell0];
}

-(void)setupGroup3
{
    DCGroup *group = [[DCGroup alloc]init];
    [self.groupDatas addObject:group];
    
    DCWeChatCellModel *cell0 = [DCCellArrowModel cellWithIcon:@"me_setting" title:@"设置" destVC:[DCSettingViewController class]];
    
    group.cells = @[cell0];
    
}
-(void)clickImageBtn:(UIButton *)btn
{
    NSLog(@"clickImageBtn");
//    DCMyPictureViewController *VC = [[DCMyPictureViewController alloc]init];
//    DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:VC];
//    
//    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:nil];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 40;
    }
    else
    {
        return 0;
    }
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
