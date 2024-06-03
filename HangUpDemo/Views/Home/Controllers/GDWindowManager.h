//
//  GDWindowManager.h
//  NewProject
//
//  Created by 1084-Wangcl-Mac on 2024/4/15.
//  Copyright © 2024 Charles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDWindowManager : NSObject <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIViewController *target;
@property (nonatomic, strong) UIWindow *keywindow;
@property (nonatomic, strong) UIButton *moveButton;

+ (GDWindowManager *)sharedManager;

@end
