//
//  UIView+WaterMark.m
//  HangUpDemo
//
//  Created by 1084-Wangcl-Mac on 2022/7/13.
//  Copyright © 2022 Charles. All rights reserved.
//

#import "UIView+WaterMark.h"

@implementation UIView (WaterMark)

- (void)addWaterMarkText:(NSString*)waterText WithTextColor:(UIColor*)color WithFont:(UIFont*)font WithOpacity:(float)opacity {
    //计算水印文字的宽高
    NSString *waterMark = waterText;
    CGSize textSize = [waterMark sizeWithAttributes:@{NSFontAttributeName:font}];
    CGFloat height =  [UIScreen mainScreen].bounds.size.height;
    CGFloat width =  [UIScreen mainScreen].bounds.size.width;
    NSInteger row = 5; //行
    NSInteger col = 2; //列
   
    for (int i = 0; i < row; i ++) {
        for (int j = 0; j < col; j ++) {
            CATextLayer *textLayer = [[CATextLayer alloc]init];
            textLayer.contentsScale = [UIScreen mainScreen].scale;//按当前屏幕分辨显示，否则会模糊
            CFStringRef fontName = (__bridge CFStringRef)font.fontName;
            CGFontRef fontRef =CGFontCreateWithFontName(fontName);
            textLayer.font = fontRef;
            textLayer.fontSize = font.pointSize;
            textLayer.foregroundColor = color.CGColor;
            textLayer.string = waterMark;
            textLayer.opacity = opacity;
            textLayer.alignmentMode = kCAAlignmentCenter;
            textLayer.frame = CGRectMake(j*width/col+50,  i*(height/5), textSize.width, textSize.height);
            //旋转文字
            textLayer.transform = CATransform3DMakeRotation(-M_PI/5, 0,0,3);
            [self.layer addSublayer:textLayer];
        }
    }
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
//        return nil;
//    }
//    return self;
//}

@end
