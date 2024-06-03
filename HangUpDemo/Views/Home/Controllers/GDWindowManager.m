//
//  GDWindowManager.m
//  NewProject
//
//  Created by 1084-Wangcl-Mac on 2024/4/15.
//  Copyright © 2024 Charles. All rights reserved.
//

#import "GDWindowManager.h"


@implementation GDWindowManager

+ (GDWindowManager *)sharedManager {
    static GDWindowManager *windowManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        windowManager = [[GDWindowManager alloc] init];
        assert(windowManager != nil);
    });
    return windowManager;
}

- (id)init {
    if (self = [super init]) {
        self.keywindow = [UIApplication sharedApplication].keyWindow;
    }
    return self;
}

- (UIButton *)moveButton {
    if (!_moveButton) {
        CGFloat topSafeH = 0;
        if (@available(iOS 11.0, *)) {
            topSafeH = self.keywindow.safeAreaInsets.top;
        }
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 2022111501;
        button.backgroundColor = UIColorHex(0xfbb843);
        button.layer.cornerRadius = 25;
        button.layer.masksToBounds = YES;
        [button setTitle:@"挂起" forState:UIControlStateNormal];
        [button setTitle:@"返回" forState:UIControlStateSelected];
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [self.keywindow addSubview:button];
        button.frame = CGRectMake(kScreenWidth - 50 - 10, kScreenHeight - topSafeH - 120 , 50, 50);
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _moveButton = button;
        // 添加一个平移手势识别器
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        panGesture.delegate = self;
        [_moveButton addGestureRecognizer:panGesture];
    }
    return _moveButton;
}

- (void)buttonAction:(UIButton *)button {
    button.selected = !button.selected;
    UIViewController *currentVC = [self.keywindow rootViewController];
    while (true) {
        if (currentVC.presentedViewController) {
            currentVC = currentVC.presentedViewController;
        } else if ([currentVC isKindOfClass:[UINavigationController class]] && [(UINavigationController *)currentVC topViewController]) {
            currentVC = [(UINavigationController *)currentVC topViewController];
        } else if ([currentVC isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tab = (UITabBarController *)currentVC;
            currentVC = tab.selectedViewController;
        } else {
            break;
        }
    }
    if (button.selected) {
        self.target = currentVC;
        UIViewController *firstVC = currentVC.navigationController.viewControllers.firstObject;
        currentVC.navigationController.viewControllers = @[firstVC];
    } else {
        [currentVC.navigationController pushViewController:self.target animated:YES];
        self.target = nil;
    }
}

// 处理平移手势事件
- (void)handlePanGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:self.keywindow];
    gestureRecognizer.view.center = CGPointMake(gestureRecognizer.view.center.x + translation.x, gestureRecognizer.view.center.y + translation.y);
    [gestureRecognizer setTranslation:CGPointZero inView:self.keywindow];
      
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        // 在这里可以添加逻辑，比如当手势结束时，将按钮的位置保存下来等。
    }
}
  
// 代理方法，确保同时识别多个手势（如果需要的话）
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
