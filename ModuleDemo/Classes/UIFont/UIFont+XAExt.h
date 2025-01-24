//
//  UIFont+XAExt.h
//  HealthCompanionIOS
//
//  Created by llj on 2024/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (XAExt)

/// iconfont 字体
/// @param size 大小
+ (UIFont *)bot_iconFontWithSize:(CGFloat)size;
/// 常规体
/// @param size 大小
+ (UIFont *)bot_regularFontWithSize:(CGFloat)size;
/// 中黑体
/// @param size 大小
+ (UIFont *)bot_mediumFontWithSize:(CGFloat)size;
/// 中粗体
/// @param size 大小
+ (UIFont *)bot_semiboldFontWithSize:(CGFloat)size;
/// 粗体
/// @param size 大小
+ (UIFont *)bot_boldFontWithSize:(CGFloat)size;
@end

NS_ASSUME_NONNULL_END
