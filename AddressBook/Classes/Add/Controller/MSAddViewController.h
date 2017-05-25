//
//  MSAddViewController.h
//  AddressBook
//
//  Created by Ashscar on 17/3/1.
//  Copyright © 2017年 Ashscar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MSAddViewController, MSContacts;


@protocol MSAddViewControllerDelegate <NSObject>

@optional

- (void)addViewController:(MSAddViewController *)addVc didAddContacts:(MSContacts *)contacts;

@end

@interface MSAddViewController : UIViewController

@property (nonatomic, strong) id<MSAddViewControllerDelegate> delegate;

@end
