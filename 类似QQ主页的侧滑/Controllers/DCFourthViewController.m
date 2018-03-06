//
//  DCFourthViewController.m
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/5/24.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "DCFourthViewController.h"
#import "DCTabBarViewController.h"
@interface DCFourthViewController ()

@end

@implementation DCFourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"fourth title";
    
    [self setUpBackgroundImage:[UIImage imageNamed:@"12345.jpg"]];
    
    UIButton *shopCarBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, 155, 55)];
    shopCarBtn.backgroundColor = [UIColor redColor];
    [shopCarBtn setTitle:@"微信" forState:UIControlStateNormal];
    [shopCarBtn addTarget:self action:@selector(shopCarBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shopCarBtn];
}

-(void)shopCarBtnDidClick
{
    DCTabBarViewController *TabBarVC = [[DCTabBarViewController alloc]init];
    [self.navigationController pushViewController:TabBarVC animated:YES];
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
