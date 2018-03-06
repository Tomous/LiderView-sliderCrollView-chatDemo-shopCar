
//
//  DCPersonalViewController.m
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/5/24.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "DCPersonalViewController.h"
#import "DCFirstViewController.h"

@interface DCPersonalViewController ()

@end

@implementation DCPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"personal messages";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(backLastVC)];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 250, self.view.width, 1)];
    line.backgroundColor = [UIColor redColor];
    [self.view addSubview:line];
    
    //个人头像
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"123456.jpg"]];
    imageView.width = 80;
    imageView.height = imageView.width;
    imageView.x = (self.view.width - imageView.width) / 2;
    imageView.y = line.y + line.height / 2 - imageView.height / 2;
    imageView.layer.cornerRadius = imageView.width / 2;
    imageView.layer.masksToBounds = true;
    [self.view addSubview:imageView];
    
    
    
}
-(void)backLastVC
{
    [self.navigationController pushViewController:[[DCFirstViewController alloc]init] animated:YES];
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
