//
//  MSContactsViewController.m
//  AddressBook
//
//  Created by Ashscar on 17/3/1.
//  Copyright © 2017年 Ashscar. All rights reserved.
//

#import "MSContactsViewController.h"
#import "MSAddViewController.h"
#import "MSEditViewController.h"
#import "MSContacts.h"

@interface MSContactsViewController ()<MSAddViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *contact;

@end

@implementation MSContactsViewController

- (NSMutableArray *)contact {
    
    if (_contact == nil) {
        _contact = [NSMutableArray array];
    }
    return _contact;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableCell) name:@"updateContact" object:nil];
}



//注销
- (IBAction)singInUp:(id)sender {
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示！" message:@"你确定要注销吗？" preferredStyle:0];
    UIAlertAction *actionNo = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *actionYes = [UIAlertAction actionWithTitle:@"注销" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [alertVc addAction:actionYes];
    [alertVc addAction:actionNo];
    [self presentViewController:alertVc animated:YES completion:nil];
    
}

//#pragma mark --
//添加一个新的联系人时调用
- (void)addViewController:(MSAddViewController *)addVc didAddContacts:(MSContacts *)contacts {
    //保存联系人
    [self.contact addObject:contacts];
    //更新联系人
    [self reloadTableCell];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[MSAddViewController class]]) {
        MSAddViewController *addVC = segue.destinationViewController;
        addVC.delegate = self;
    } else {

        MSEditViewController *editVc = segue.destinationViewController;
        // 获取选中cell的角标
        
        NSIndexPath *selIndexPath = [self.tableView indexPathForSelectedRow];
        
        MSContacts *contacts = self.contact[selIndexPath.row];
        
        // 获取cell对应的联系人模型
        editVc.contacts = contacts;
        
    }
}

- (void)reloadTableCell {
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contact.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //    if (cell == nil) {
    //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    //    }
    
    // 获取模型
    MSContacts *c = self.contact[indexPath.row];
    
    cell.textLabel.text = c.name;
    cell.detailTextLabel.text = c.phoneNumber;
    
    return cell;
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
