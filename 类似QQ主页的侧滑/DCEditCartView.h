//
//  DCEditCartView.h
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/5/31.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol EditCartViewDelegate <NSObject>

-(void)EditCartView:(NSInteger)num;

-(void)EditCartView;

@end

@interface DCEditCartView : UIView

@property (nonatomic, weak) id<EditCartViewDelegate>delegate;

@property(nonatomic, assign) NSInteger numInteger;

@property(nonatomic, strong) NSString *styleString;

@property(nonatomic, assign) NSInteger maxInteger;

@property (nonatomic, assign) NSInteger minInteget;

@end
