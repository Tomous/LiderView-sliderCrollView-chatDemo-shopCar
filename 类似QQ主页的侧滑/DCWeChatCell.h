//
//  DCWeChatCell.h
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/6/1.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCWeChatCellModel.h"

@interface DCWeChatCell : UITableViewCell
-(void)setIndexPath:(NSIndexPath *)indexPath numberOfRowInSection:(NSInteger)rowsCount;

@property(strong,nonatomic)DCWeChatCellModel *cellModel;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
