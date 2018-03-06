//
//  DCLeftMenuViewController.m
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/5/24.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "DCLeftMenuViewController.h"
#import "DCFirstViewController.h"
#import "DCSecondViewController.h"
#import "ThirdViewController.h"
#import "DCFourthViewController.h"
#import "DCPersonalViewController.h"
@interface DCLeftMenuViewController ()

@property(strong,nonatomic)UITableView *tableView;

@end

@implementation DCLeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * 5) / 2.0f, self.view.frame.size.width, 54 * 5) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = NO;
        tableView;
    });
    [self.view addSubview:self.tableView];

    UIButton *personalPhotoBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 60, 80, 80)];
    [personalPhotoBtn setImage:[UIImage imageNamed:@"12345.jpg"] forState:UIControlStateNormal];
    [personalPhotoBtn addTarget:self action:@selector(personalPhotoBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    personalPhotoBtn.layer.cornerRadius = personalPhotoBtn.frame.size.width / 2;
    personalPhotoBtn.layer.masksToBounds = true;
    [self.view addSubview:personalPhotoBtn];
}

//添加Menu菜单上面的子控制器
#pragma mark UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[DCFirstViewController alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[DCSecondViewController alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 2:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc]initWithRootViewController:[[ThirdViewController alloc]init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        case 3:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc]initWithRootViewController:[[DCFourthViewController alloc]init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        default:
            break;
    }
}

#pragma mark -
#pragma mark UITableView Datasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    NSArray *titles = @[@"Home", @"Chat", @"Profile", @"Settings", @"Log Out"];
    NSArray *images = @[@"IconHome", @"IconCalendar", @"IconProfile", @"IconSettings", @"IconEmpty"];
    cell.textLabel.text = titles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    
    return cell;
}

-(void)personalPhotoBtnDidClick
{
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc]initWithRootViewController:[[DCPersonalViewController alloc]init]]
                                                 animated:YES];
    [self.sideMenuViewController hideMenuViewController];
    NSLog(@"personalPhotoBtnDidClick");
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
