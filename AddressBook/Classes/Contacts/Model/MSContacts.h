//
//  MSContacts.h
//  AddressBook
//
//  Created by Ashscar on 17/3/1.
//  Copyright © 2017年 Ashscar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSContacts : NSObject


@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phoneNumber;

+ (instancetype)contactsWithPhoneNumber:(NSString *)phoneNumber name:(NSString *)name;
@end
