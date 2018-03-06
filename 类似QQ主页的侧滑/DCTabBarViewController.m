//
//  DCTabBarViewController.m
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/6/1.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "DCTabBarViewController.h"
#import "DCNavigationViewController.h"

#import "DCWeChatViewController.h"
#import "DCChatListViewController.h"
#import "DCDiscoverViewController.h"
#import "DCProfileViewController.h"
@interface DCTabBarViewController ()

@end

@implementation DCTabBarViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //------添加控制器---------
    DCWeChatViewController *WeChatVC = [[DCWeChatViewController alloc]init];
    [self addchilVC:WeChatVC title:@"微信" imageName:@"tabbar_mainframe" selImageName:@"tabbar_mainframeHL"];
    
    
    DCChatListViewController *ChatListVC = [[DCChatListViewController alloc]init];
    [self addchilVC:ChatListVC title:@"通讯录" imageName:@"tabbar_contacts" selImageName:@"tabbar_contactsHL"];
    
    DCDiscoverViewController *discoverVC = [[DCDiscoverViewController alloc]init];
    [self addchilVC:discoverVC title:@"发现" imageName:@"tabbar_discover" selImageName:@"tabbar_discoverHL"];
    
    DCProfileViewController *profileVC = [[DCProfileViewController alloc]init];
    [self addchilVC:profileVC title:@"我" imageName:@"tabbar_me" selImageName:@"tabbar_meHL"];
    
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *selDict = [NSMutableDictionary dictionary];
    selDict[NSForegroundColorAttributeName] = [UIColor greenColor];
    [item setTitleTextAttributes:selDict forState:UIControlStateSelected];
    

}

-(void)addchilVC:(UIViewController *)VC title:(NSString *)title imageName:(NSString *)imageName selImageName:(NSString *)selImageName
{
    VC.title = title;
    
    UIImage *selImage = [UIImage imageWithName:selImageName];
    
    if (iOS7) {
        selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    [VC.tabBarItem setImage:[UIImage imageWithName:imageName]];
    [VC.tabBarItem setSelectedImage:selImage];
    
    DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:VC];
    [self addChildViewController:nav];
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
