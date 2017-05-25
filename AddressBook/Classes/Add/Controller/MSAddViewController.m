//
//  MSAddViewController.m
//  AddressBook
//
//  Created by Ashscar on 17/3/1.
//  Copyright © 2017年 Ashscar. All rights reserved.
//

#import "MSAddViewController.h"
#import "MSContacts.h"

@interface MSAddViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *numberTF;


@end

@implementation MSAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.nameTF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
     [self.numberTF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}

//保存模型，然后通过代理传给contactsVC
- (IBAction)save:(id)sender {
    
    MSContacts *c = [MSContacts contactsWithPhoneNumber:self.numberTF.text name:self.nameTF.text];
    if ([_delegate respondsToSelector:@selector(addViewController:didAddContacts:)]) {
        [_delegate addViewController:self didAddContacts:c];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)textChange {
    
    self.saveBtn.enabled = self.nameTF.text.length && self.numberTF.text.length;
    
}



@end
