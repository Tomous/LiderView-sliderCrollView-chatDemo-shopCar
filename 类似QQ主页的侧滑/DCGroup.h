//
//  DCGroup.h
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/6/1.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCGroup : NSObject

@property(copy,nonatomic) NSString *header;
@property(copy,nonatomic) NSString *footer;


@property(strong,nonatomic)NSArray *cells;

@end
