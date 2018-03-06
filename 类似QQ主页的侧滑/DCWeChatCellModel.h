//
//  DCWeChatCellModel.h
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/6/1.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCWeChatCellModel : NSObject

// 点击cell跳到哪个控制器
@property(assign,nonatomic)Class destVC;

@property(copy,nonatomic) NSString *title;

@property(copy,nonatomic) NSString *icon;

// label下面的字体
@property(copy,nonatomic) NSString *subTitle;

-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destVC:(Class)destVC;

+(instancetype)cellWithIcon:(NSString *)icon title:(NSString *)title destVC:(Class)destVC;

@end
