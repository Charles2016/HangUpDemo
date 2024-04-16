//
//  CHNavigationController.m
//  HangUpDemo
//
//  Created by 1084-Wangcl-Mac on 2022/7/22.
//  Copyright © 2022 Charles. All rights reserved.
//

#import "SuperNavigationController.h"

@interface SuperNavigationController ()

@end

@implementation SuperNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
    self.delegate = self;
    self.stack = [[NSMutableArray alloc] init];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    @synchronized(self.stack) {
        if (self.transitioning) {
            void (^codeBlock)(void) = [^{
                [super popViewControllerAnimated:animated];
            } copy];
            [self.stack addObject:codeBlock];
            // We cannot show what viewcontroller is currently animated now
            return nil;
        } else {
            return [super popViewControllerAnimated:animated];
        }
    }
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
    @synchronized(self.stack) {
        if (self.transitioning) {
            void (^codeBlock)(void) = [^{
                [super popToRootViewControllerAnimated:animated];
            } copy];
            [self.stack addObject:codeBlock];
            // We cannot show what viewcontroller is currently animated now
            return nil;
        } else {
            return [super popToRootViewControllerAnimated:animated];
        }
    }
}

- (NSArray*)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    @synchronized(self.stack) {
        if (self.transitioning) {
            void (^codeBlock)(void) = [^{
                [super popToViewController:viewController animated:animated];
            } copy];
            [self.stack addObject:codeBlock];
            // We cannot show what viewcontroller is currently animated now
            return nil;
        } else {
            return [super popToViewController:viewController animated:animated];
        }
    }
}

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated {
    @synchronized(self.stack) {
        if (self.transitioning) {
            // Copy block so its no longer on the (real software) stack
            void (^codeBlock)(void) = [^{
                [super setViewControllers:viewControllers animated:animated];
            } copy];
            // Add to the stack list and then release
            [self.stack addObject:codeBlock];
        } else {
            [super setViewControllers:viewControllers animated:animated];
        }
    }
}

- (void)pushCodeBlock:(void (^)())codeBlock {
    @synchronized(self.stack) {
        [self.stack addObject:[codeBlock copy]];
        if (!self.transitioning)
            [self runNextBlock];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    @synchronized(self.stack) {
        if (self.transitioning) {
            // 如果有控制器正在被push,那么忽略其它控制器，所以这里注释掉. yangxu
            /*
             void (^codeBlock)(void) = [^{
             [super pushViewController:viewController animated:animated];
             } copy];
             [self.stack addObject:codeBlock];
             */
        } else {
            self.interactivePopGestureRecognizer.enabled = NO;
            [super pushViewController:viewController animated:animated];
        }
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    @synchronized (self.stack) {
        self.transitioning = true;
        if ([[[UIDevice currentDevice] systemVersion ] floatValue] > 7.0) {
            // 此为ios7独有操作，在iOS6会导致崩溃
            id <UIViewControllerTransitionCoordinator> transitionCoordinator = navigationController.topViewController.transitionCoordinator;
            [transitionCoordinator notifyWhenInteractionEndsUsingBlock:^(id <UIViewControllerTransitionCoordinatorContext> context) {
                if ([context isCancelled]) {
                    @synchronized (self.stack) {
                        self.transitioning = false;
                    }
                }
            }];
        }
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    @synchronized(self.stack) {
        if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            if(viewController != [navigationController.viewControllers objectAtIndex:0]) {
                navigationController.interactivePopGestureRecognizer.enabled = YES;
            } else {
                viewController.navigationController.interactivePopGestureRecognizer.enabled = NO;
            }
        }
        self.transitioning = false;
        [self runNextBlock];
    }
}

- (void)runNextBlock {
    if (self.stack.count == 0)
        return;
    void (^codeBlock)(void) = [self.stack objectAtIndex:0];
    // Execute block, then remove it from the stack (which will dealloc)
    codeBlock();
    [self.stack removeObjectAtIndex:0];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self.topViewController preferredStatusBarStyle];
}

@end
