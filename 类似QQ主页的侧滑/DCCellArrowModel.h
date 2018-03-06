//
//  DCCellArrowModel.h
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/6/1.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "DCWeChatCellModel.h"

@interface DCCellArrowModel : DCWeChatCellModel

-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destVC:(Class)destVC;

+(instancetype)cellWithIcon:(NSString *)icon title:(NSString *)title destVC:(Class)destVC;

@end
