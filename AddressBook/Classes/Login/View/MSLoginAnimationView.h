//
//  MSLoginAnimationView.h
//  AddressBook
//
//  Created by Ashscar on 17/2/26.
//  Copyright © 2017年 Ashscar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSLoginAnimationView : UIView
//开始动画
- (void)startAnim:(BOOL)isClose;

//获得view
+ (instancetype)loginAnimationView;

@end
