//
//  SuperNavigationController+SPFullscreenPopGesture.h
//  HangUpDemo
//
//  Created by 1084-Wangcl-Mac on 2022/7/22.
//  Copyright © 2022 Charles. All rights reserved.
//

#import "SuperNavigationController.h"

NS_ASSUME_NONNULL_BEGIN

/// "SuperNavigationController+SPFullscreenPopGesture" extends UINavigationController's swipe-
/// to-pop behavior in iOS 7+ by supporting fullscreen pan gesture. Instead of
/// screen edge, you can now swipe from any place on the screen and the onboard
/// interactive pop transition works seamlessly.
///
/// Adding the implementation file of this category to your target will
/// automatically patch UINavigationController with this feature.
@interface SuperNavigationController (SPFullscreenPopGesture)


/// The gesture recognizer that actually handles interactive pop.
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *sp_fullscreenPopGestureRecognizer;
/// A view controller is able to control navigation bar's appearance by itself,
/// rather than a global way, checking "sp_prefersNavigationBarHidden" property.
/// Default to YES, disable it if you don't want so.
@property (nonatomic, assign) BOOL sp_viewControllerBasedNavigationBarAppearanceEnabled;

@end

/// Allows any view controller to disable interactive pop gesture, which might
/// be necessary when the view controller itself handles pan gesture in some
/// cases.
@interface UIViewController (SPFullscreenPopGesture)

/// Whether the interactive pop gesture is disabled when contained in a navigation
/// stack.
@property (nonatomic, assign) BOOL sp_interactivePopDisabled;

/// Indicate this view controller prefers its navigation bar hidden or not,
/// checked when view controller based navigation bar's appearance is enabled.
/// Default to NO, bars are more likely to show.
@property (nonatomic, assign) BOOL sp_prefersNavigationBarHidden;

/// Max allowed initial distance to left edge when you begin the interactive pop
/// gesture. 0 by default, which means it will ignore this limit.
@property (nonatomic, assign) CGFloat sp_interactivePopMaxAllowedInitialDistanceToLeftEdge;

@end

NS_ASSUME_NONNULL_END
