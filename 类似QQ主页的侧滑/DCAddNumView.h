//
//  DCAddNumView.h
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/5/31.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddNumViewDelegate <NSObject>

-(void)AddNumView:(NSInteger)num;

@end

@interface DCAddNumView : UIView

{
    
    UIButton *minusBtn;
    UIButton *addBtn;
    UILabel *numLabel;
    NSInteger num;
}

@property (nonatomic, weak) id<AddNumViewDelegate>delegate;

@property (nonatomic, assign) NSInteger numInteger;

@property (nonatomic, assign) NSInteger minInteget;

@end
