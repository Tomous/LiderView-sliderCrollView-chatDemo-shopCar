//
//  DCShoppingTableViewCell.h
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/5/31.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCShoppingModel.h"
#import "DCShoppingBtn.h"
@protocol ShoppingTableViewCellDelegate <NSObject>

-(void)ShoppingTableViewCell:(ShoppingCellModel *)model;

@end

@interface DCShoppingTableViewCell : UITableViewCell

@property (nonatomic, weak) id<ShoppingTableViewCellDelegate>delegate;

@property (nonatomic, strong) ShoppingCellModel *model;

@end
