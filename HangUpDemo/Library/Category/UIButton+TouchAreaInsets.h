//
//  UIButton+TouchAreaInsets.h
//  CarShop
//
//  Created by Charles on 4/17/17.
//  Copyright © 2017 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop,    //< image在上，label在下
    MKButtonEdgeInsetsStyleLeft,   //< image在左，label在右
    MKButtonEdgeInsetsStyleBottom, //< image在下，label在上
    MKButtonEdgeInsetsStyleRight   //< image在右，label在左
};

@interface UIButton (TouchAreaInsets)

/**
 *  @brief  设置按钮额外热区
 */
@property (nonatomic, assign) UIEdgeInsets touchAreaInsets;

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
