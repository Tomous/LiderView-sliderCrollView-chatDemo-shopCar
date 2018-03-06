//
//  DCFirstViewController.m
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/5/24.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "DCFirstViewController.h"
#import "HYBLoopScrollView.h"
#import "HYBPageControl.h"
@interface DCFirstViewController ()

@property (nonatomic, weak) HYBLoopScrollView *loop;

@end

@implementation DCFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"first Controller";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(presentLeftMenuViewController:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Right"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(presentRightMenuViewController:)];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    imageView.image = [UIImage imageNamed:@"123.jpg"];
//    [self.view addSubview:imageView];
    
    //循环轮播图片
    [self setUpScrollView];
}
/**
 *  顶部的循环轮播图片
 */
-(void)setUpScrollView
{
//    NSString *url = @"http://test.meirongzongjian.com/imageServer/user/3/42ccb9c75ccf5e910cd6f5aaf0cd1200.jpg";
    
    NSArray *images = @[//@"http://7xrs9h.com1.z0.glb.clouddn.com/wp-content/uploads/2016/03/QQ20160322-0@2x.png",
                        @"123.jpg",
                        @"1234.jpg",
                        //url,
                        @"12345.jpg",
                        @"123456.jpg",
                        ];
    
    NSArray *titles = @[@"这里可以添加文字",
                        @"label的颜色也可以变哦！",
                        @"         ",
                        @"44444444",
                        ];
    
    // 当有导航条时，若距离上面不点满，或者被挡一部分，请一定要设置这一行，因为7.0之后self.view的起点坐标从状态栏开始的。
    self.edgesForExtendedLayout = UIRectEdgeNone;
    __weak __typeof(self) weakSelf = self;
    HYBLoopScrollView *loop = [HYBLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 0, self.view.width, 200) imageUrls:images timeInterval:2.0 didSelect:^(NSInteger atIndex) {

        NSLog(@"点击第%ld张图片",(long)atIndex +1);
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
        
        UIViewController *VCC = [[UIViewController alloc]init];
        VCC.view.backgroundColor = [UIColor whiteColor];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:VCC.view.bounds];;
        switch (atIndex) {
            case 0:
                imageView.image = [UIImage imageNamed:@"123.jpg"];
                break;
            case 1:
                imageView.image = [UIImage imageNamed:@"1234.jpg"];
                break;
            case 2:
                imageView.image = [UIImage imageNamed:@"12345.jpg"];
                break;
            case 3:
                imageView.image = [UIImage imageNamed:@"123456.jpg"];
                break;
            default:
                break;
        }
        [VCC.view addSubview:imageView];
        [self.navigationController pushViewController:VCC animated:YES];
        
        
    } didScroll:^(NSInteger toIndex) {
        
        NSLog(@"滚动到第%ld张图片--%ld",(long)toIndex +1,(long)toIndex + 1);
        
    }];
    
    loop.backgroundColor = [UIColor whiteColor];
    loop.shouldAutoClipImageToViewSize = YES;
    //背景图片
    loop.placeholder = [UIImage imageNamed:@"12345.jpg"];
    
    loop.alignment = kPageControlAlignRight;
    //添加文字
    loop.adTitles = titles;
    [self.view addSubview:loop];
    
    [loop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(190);
        make.top.mas_equalTo(0);
    }];
    self.loop = loop;
    
    loop.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    // page control小圆点太小？可以修改的
//    loop.pageControl.size = 10;
    // 不希望显示pagecontrol？
//      loop.pageControl.hidden = YES;
    // 或者直接
    //  [loop.pageControl removeFromSuperview];
    
    // 默认的是UIViewContentModeScaleAspectFit
    //  loop.imageContentMode = UIViewContentModeScaleToFill;
    //    loop.imageContentMode = UIViewContentModeScaleAspectFill;
    //清理掉本地缓存
    [loop clearImagesCache];
    
//    HYBLoadImageView *imageView = [[HYBLoadImageView alloc] init];
//    imageView.frame = CGRectMake(20, 250, 100, 100);
//    imageView.isCircle = YES;
//    imageView.hyb_borderColor = [UIColor redColor];
//    imageView.hyb_borderWidth = 1;
//    [self.view addSubview:imageView];
//    
//    [imageView setImageWithURLString:nil placeholderImage:@"h2.jpg"];
//    imageView.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
//    [imageView addGestureRecognizer:tap];

}
- (void)onTap {
    // 测试内存是否得到释放
    //    TestViewController *vc = [[TestViewController alloc] init];
    //    [self.navigationController pushViewController:vc animated:YES];
    
    NSLog(@"--------");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //开始轮播
    [self.loop startTimer];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //关闭轮播
    [self.loop pauseTimer];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
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
