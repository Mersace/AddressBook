//
//  MSLoginViewController.m
//  AddressBook
//
//  Created by Ashscar on 17/2/26.
//  Copyright © 2017年 Ashscar. All rights reserved.
//

#import "MSLoginViewController.h"
#import "MSLoginAnimationView.h"


@interface MSLoginViewController ()<UITextFieldDelegate>
@property (nonatomic, weak) MSLoginAnimationView *animationView;

@property (weak, nonatomic) IBOutlet UIView *contenView;
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UISwitch *rememberPwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation MSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MSLoginAnimationView *animationView = [MSLoginAnimationView loginAnimationView];
    _animationView = animationView;
    [_contenView addSubview:animationView];
    
    _account.delegate = self;
    _password.delegate = self;
    
    [_account addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_password addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
}

#pragma mark -- UITextFieldDelegate --start


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField.frame.origin.y == self.account.frame.origin.y) {
        [_animationView startAnim:NO];
    } else {
        [_animationView startAnim:YES];
    }
}


#pragma mark -- UITextFieldDelegate --end

- (IBAction)remenberPwd:(UISwitch *)sender {
    
    if (sender.on == NO) {
        [_autoLoginSwitch setOn:NO animated:YES];
    }
}

- (IBAction)autoLogin:(UISwitch *)sender {
    if (sender.on == YES) {
        [_rememberPwdSwitch setOn:YES animated:YES];
    }
    
}

- (void)textChange {
    _loginButton.enabled = _account.text.length && _password.text.length;
}

- (IBAction)login:(id)sender {
    
    if ([_account.text isEqualToString:@"masen"] && [_password.text isEqualToString:@"123"]) {
        [self performSegueWithIdentifier:@"login2Contacts" sender:nil];
    } 
    
}

@end
