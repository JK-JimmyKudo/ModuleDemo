//
//  UIImage+PureColorImage.h
//  SmartHome
//
//  Created by 赵言 on 2019/7/4.
//  Copyright © 2019 赵言. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (PureColorImage)

+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage *)imageWithAndColor:(UIColor *)color;

/// 将图片旋转成UIImageOrientationUp
- (UIImage *)fixOrientation;


/// UIImage 着色
/// @param color 目标颜色
- (UIImage*)imageWithColor:(UIColor*)color;


/// base64字符串转图片
/// @param base64String 图片base64字符串
+ (UIImage *)imageWithBase64String:(NSString *)base64String;

@end

NS_ASSUME_NONNULL_END
