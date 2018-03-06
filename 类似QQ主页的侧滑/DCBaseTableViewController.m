//
//  DCBaseTableViewController.m
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/6/1.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "DCBaseTableViewController.h"
#import "DCWeChatCellModel.h"
#import "DCGroup.h"
#import "DCWeChatCell.h"
//#import "DCCellArrowModel.h"

@interface DCBaseTableViewController ()

@property(strong,nonatomic)NSMutableArray *groupDatas;

@end

@implementation DCBaseTableViewController

-(NSMutableArray *)groupDatas
{
    if (!_groupDatas) {
        _groupDatas = [NSMutableArray array];
    }
    return _groupDatas;
}

-(instancetype)init
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    if (self.tabBarController.viewControllers.count > 0) {
        self.tabBarController.hidesBottomBarWhenPushed = YES;
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.groupDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    DCGroup *g = self.groupDatas[section];
    return g.cells.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCWeChatCell *cell = [DCWeChatCell cellWithTableView:tableView];
    DCGroup *g = self.groupDatas[indexPath.section];
    DCWeChatCellModel *cellModel = g.cells[indexPath.row];
    cell.cellModel = cellModel;
    
    [cell setIndexPath:indexPath numberOfRowInSection:g.cells.count];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    DCGroup *g = self.groupDatas[section];
    return g.header;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    DCGroup *g = self.groupDatas[section];
    return g.footer;
}
// 点击每一个cell 都会来到这里
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 取消选中哪一行
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DCGroup *g = self.groupDatas[indexPath.section];
    DCWeChatCellModel *cell = g.cells[indexPath.row];
    
    // 如果是检查版本更新  弹框  一段代码 block
    
    //    if([cell isKindOfClass:[DCCellArrowModel class]]) {
    
    //        DCCellArrowModel *arrowItem = (DCCellArrowModel *)cell;
    
    UIViewController *destVC = [[cell.destVC alloc]init];
    
    [self.navigationController pushViewController:destVC animated:YES];
    //    }
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
