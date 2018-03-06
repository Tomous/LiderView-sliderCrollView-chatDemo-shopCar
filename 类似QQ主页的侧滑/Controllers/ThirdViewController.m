//
//  ThirdViewController.m
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/5/24.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "ThirdViewController.h"
#import "DCShoppingCartViewController.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Third Controller";
    [self setUpBackgroundImage:[UIImage imageNamed:@"123456.jpg"]];
    
    
    UIButton *shopCarBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, 155, 55)];
    shopCarBtn.backgroundColor = [UIColor redColor];
    [shopCarBtn setTitle:@"购物车" forState:UIControlStateNormal];
    [shopCarBtn addTarget:self action:@selector(shopCarBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shopCarBtn];
}

-(void)shopCarBtnDidClick
{
    DCShoppingCartViewController *shopVC = [[DCShoppingCartViewController alloc]init];
    [self.navigationController pushViewController:shopVC animated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"DCSecondViewController will appear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"DCSecondViewController will disappear");
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
