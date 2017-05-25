//
//  MSLoginAnimationView.m
//  AddressBook
//
//  Created by Ashscar on 17/2/26.
//  Copyright © 2017年 Ashscar. All rights reserved.
//

#import "MSLoginAnimationView.h"

@interface MSLoginAnimationView()


@property (weak, nonatomic) IBOutlet UIImageView *leftHand;
@property (weak, nonatomic) IBOutlet UIImageView *rightHand;

@property (weak, nonatomic) IBOutlet UIImageView *leftArm;
@property (weak, nonatomic) IBOutlet UIImageView *rightArm;

@property (nonatomic, assign) CGFloat offSetX;
@property (nonatomic, assign) CGFloat offSetY;

@end

@implementation MSLoginAnimationView


+ (instancetype)loginAnimationView {
     return [[NSBundle mainBundle] loadNibNamed:@"MSLoginAnimationView" owner:nil options:nil][0];
}

- (void)awakeFromNib {
    
    _offSetX = self.leftArm.frame.origin.x - self.leftHand.frame.origin.x;
    _offSetY = self.leftHand.frame.origin.y - self.leftArm.frame.origin.y;
    
    self.leftArm.transform = CGAffineTransformMakeTranslation(-_offSetX*2, _offSetY*2);
    self.rightArm.transform = CGAffineTransformMakeTranslation(_offSetX*2, _offSetY*2);


   
}

- (void)startAnim:(BOOL)isClose {
    
    
    if (isClose) {//闭眼
        [UIView animateWithDuration:0.1 animations:^{
            self.leftArm.transform = CGAffineTransformIdentity;
            self.rightArm.transform = CGAffineTransformIdentity;
            
            self.leftHand.transform = CGAffineTransformMakeTranslation(_offSetX, -_offSetY);
            self.leftHand.transform = CGAffineTransformMakeScale(0.01, 0.01);
            self.rightHand.transform = CGAffineTransformMakeTranslation(-_offSetX, _offSetY);
            self.rightHand.transform = CGAffineTransformMakeScale(0.01, 0.01);
            
        }];
    } else {
        //睁眼
        [UIView animateWithDuration:0.1 animations:^{
            self.leftArm.transform = CGAffineTransformMakeTranslation(-_offSetX*2, _offSetY*2);
            self.rightArm.transform = CGAffineTransformMakeTranslation(_offSetX*2, _offSetY*2);
            self.leftHand.transform = CGAffineTransformIdentity;
            self.rightHand.transform = CGAffineTransformIdentity;
        }];
    }

    
}


@end
