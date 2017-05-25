//
//  MSContacts.m
//  AddressBook
//
//  Created by Ashscar on 17/3/1.
//  Copyright © 2017年 Ashscar. All rights reserved.
//

#import "MSContacts.h"

@implementation MSContacts

+ (instancetype)contactsWithPhoneNumber:(NSString *)phoneNumber name:(NSString *)name {
    MSContacts *c = [[MSContacts alloc] init];
    c.phoneNumber = phoneNumber;
    c.name = name;
    return c;
}

@end
