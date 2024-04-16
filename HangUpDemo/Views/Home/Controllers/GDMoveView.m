//
//  GDMoveView.m
//  NewProject
//
//  Created by 1084-Wangcl-Mac on 2024/4/15.
//  Copyright © 2024 Charles. All rights reserved.
//

#import "GDMoveView.h"

@implementation GDMoveView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIButton *testAction = [UIButton buttonWithType:UIButtonTypeCustom];
        testAction.tag = 2022111501;
        testAction.backgroundColor = UIColorHex(0x55a4fc);
        testAction.layer.cornerRadius = 25;
        testAction.layer.masksToBounds = YES;
        [testAction setTitle:@"返回" forState:UIControlStateNormal];
        [testAction setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [self addSubview:testAction];
        self.button = testAction;
        self.button.frame = self.bounds;
        self.superview.userInteractionEnabled = YES;
    }
    return self;
}
  
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInView:self.superview];
}
  
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentLocation = [touch locationInView:self.superview];
    CGFloat dx = currentLocation.x - self.lastTouchLocation.x;
    CGFloat dy = currentLocation.y - self.lastTouchLocation.y;
    self.button.center = CGPointMake(self.button.center.x + dx, self.button.center.y + dy);
    self.lastTouchLocation = currentLocation;
}



@end
