//
//  DCShoppingCartViewController.h
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/5/31.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCShoppingCartViewController : UIViewController
@property (strong, nonatomic) UIView *naviView;
@property (strong, nonatomic) UIButton *returnBtn;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *editLabel;

@property (strong, nonatomic) UIView *bottomView;
@property (strong, nonatomic) UIImageView *allImage;
@property (strong, nonatomic) UIButton *allBtn;
@property (strong, nonatomic) UILabel *allPriceLabel;
@property (strong, nonatomic) UILabel *subLabel;
@property (strong, nonatomic) UIButton *settlementButton;
@property (strong, nonatomic) UILabel *settlementLabel;

@end
