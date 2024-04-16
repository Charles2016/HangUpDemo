//
//  CHNavigationController.h
//  HangUpDemo
//
//  Created by 1084-Wangcl-Mac on 2022/7/22.
//  Copyright © 2022 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SuperNavigationController : UINavigationController <UINavigationControllerDelegate,UIGestureRecognizerDelegate>

- (void)pushCodeBlock:(void(^)())codeBlock;
- (void)runNextBlock;

@property (nonatomic, strong) NSMutableArray* stack;
@property (nonatomic, assign) BOOL transitioning;

@end

NS_ASSUME_NONNULL_END
