//
//  MSEditViewController.m
//  AddressBook
//
//  Created by Ashscar on 17/3/3.
//  Copyright © 2017年 Ashscar. All rights reserved.
//

#import "MSEditViewController.h"

@interface MSEditViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editItem;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *phonenumber;
@end

@implementation MSEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _name.text = _contacts.name;
    _phonenumber.text = _contacts.phoneNumber;
    
}


- (IBAction)edit:(UIBarButtonItem *)sender {
    
    if ([sender.title isEqualToString:@"编辑"]) {
        _name.enabled = YES;
        _phonenumber.enabled = YES;
        [_phonenumber becomeFirstResponder];
        _saveBtn.hidden = NO;
        _editItem.title = @"取消";
    } else {
        _name.enabled = NO;
        _phonenumber.enabled = NO;
        _saveBtn.hidden = YES;
        _name.text = _contacts.name;
        _phonenumber.text = _contacts.phoneNumber;
        _editItem.title = @"取消";
        
    }
    
    
}

- (IBAction)save:(id)sender {
    
    _contacts.name = _name.text;
    _contacts.phoneNumber = _phonenumber.text;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateContact" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
