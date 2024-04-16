//
//  GDMoveView.h
//  NewProject
//
//  Created by 1084-Wangcl-Mac on 2024/4/15.
//  Copyright © 2024 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GDMoveView : UIView

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, assign) CGPoint lastTouchLocation;

@end

NS_ASSUME_NONNULL_END
