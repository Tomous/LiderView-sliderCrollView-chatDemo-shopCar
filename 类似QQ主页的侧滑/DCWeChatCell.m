//
//  DCWeChatCell.m
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/6/1.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "DCWeChatCell.h"
#import "DCCellSwitchModel.h"
#import "DCCellArrowModel.h"
@interface DCWeChatCell ()

@property(strong,nonatomic)UIImageView *arrowView;
@property(strong,nonatomic)UISwitch *switchView;

@end
@implementation DCWeChatCell

-(UIImageView *)arrowView
{
    if (!_arrowView) {
        _arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Arrow_Right"]];
    }
    return _arrowView;
}

-(UISwitch *)switchView
{
    if (!_switchView) {
        
        _switchView = [[UISwitch alloc]init];
        
        // 监听switch值的改变
        [self.switchView addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}
-(void)switchValueChange:(UISwitch *)switchView
{
    // 保存switch的值
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:switchView.isOn forKey:self.cellModel.title];
    
    if (switchView.isOn) {
        NSLog(@"开关打开");
    } else {
        NSLog(@"开关关闭");
    }
    
    // 立即保存起来
    [ud synchronize];
    
}
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    
    static NSString *str = @"cell";
    DCWeChatCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        
        cell = [[DCWeChatCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 设置标题的字体
        self.textLabel.font = [UIFont boldSystemFontOfSize:15];
        self.detailTextLabel.font = [UIFont systemFontOfSize:12];
        
        self.backgroundColor = [UIColor clearColor];
        
        // 创建cell的背景imageView
        self.backgroundView = [[UIImageView alloc]init];
        self.selectedBackgroundView = [[UIImageView alloc]init];
        
        
    }
    return self;
}
-(void)setCellModel:(DCWeChatCellModel *)cellModel
{
    _cellModel = cellModel;
    
    // 给子控件赋值
    self.imageView.image = [UIImage imageNamed:cellModel.icon];
    self.textLabel.text = cellModel.title;
    
    //label最下面的字体
    self.detailTextLabel.text = cellModel.subTitle;
    self.detailTextLabel.numberOfLines = 0;
    
    if ([cellModel isKindOfClass:[DCCellArrowModel class]]) {
        self.accessoryView = self.arrowView;
    }
    else if ([cellModel isKindOfClass:[DCCellSwitchModel class]])
    {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryView = self.switchView;
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        [self.switchView setOn:[ud boolForKey:self.cellModel.title]];
    }
}
-(void)setIndexPath:(NSIndexPath *)indexPath numberOfRowInSection:(NSInteger)rowsCount
{
    UIImageView *bg = (UIImageView *)self.backgroundView;
    UIImageView *selBg = (UIImageView *)self.selectedBackgroundView;
    
    if (rowsCount == 1) {
        bg.image = [UIImage resizableImage:@"common_card_background"];
        selBg.image = [UIImage resizableImage:@"common_card_background_highlighted"];
    }
    else if (indexPath.row == 0)
    {
        bg.image = [UIImage resizableImage:@"common_card_top_background"];
        selBg.image = [UIImage resizableImage:@"common_card_top_background_highlighted"];
    }
    else if (indexPath.row == rowsCount - 1)
    {
        bg.image = [UIImage resizableImage:@"common_card_bottom_background"];
        selBg.image = [UIImage resizableImage:@"common_card_bottom_background_highlighted"];
    }
    else   // 中间
    {
        bg.image = [UIImage resizableImage:@"common_card_middle_background"];
        selBg.image = [UIImage resizableImage:@"common_card_middle_background_highlighted"];
    }
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
