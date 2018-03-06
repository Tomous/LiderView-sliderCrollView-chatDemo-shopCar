//
//  DCWeChatCellModel.m
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/6/1.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "DCWeChatCellModel.h"

@implementation DCWeChatCellModel

-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destVC:(Class)destVC
{
    if (self = [super init]) {
        self.icon = icon;
        self.title = title;
        self.destVC = destVC;
    }
    return self;
}

+(instancetype)cellWithIcon:(NSString *)icon title:(NSString *)title destVC:(Class)destVC
{
    return [[self alloc]initWithIcon:icon title:title destVC:destVC];
}

@end
