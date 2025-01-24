//
//  UIFont+XAExt.m
//  HealthCompanionIOS
//
//  Created by llj on 2024/10/14.
//

#import "UIFont+XAExt.h"
#import <objc/runtime.h>

#define MyUIScreen  375 // UI设计原型图的手机尺寸宽度(6), 6p的--414

@implementation UIFont (XAExt)
+ (UIFont *)bot_iconFontWithSize:(CGFloat)size {

    return [UIFont fontWithName:@"iconfont" size:size];
}

/// 常规体
/// @param size 大小
+ (UIFont *)bot_regularFontWithSize:(CGFloat)size {
    return [UIFont systemFontOfSize:size weight:UIFontWeightRegular];
}
/// 中黑体
/// @param size 大小
+ (UIFont *)bot_mediumFontWithSize:(CGFloat)size {
    return [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
}
/// 中粗体
/// @param size 大小
+ (UIFont *)bot_semiboldFontWithSize:(CGFloat)size {
    return [UIFont systemFontOfSize:size weight:UIFontWeightSemibold];
}
/// 粗体
/// @param size 大小
+ (UIFont *)bot_boldFontWithSize:(CGFloat)size {
    return [UIFont systemFontOfSize:size weight:UIFontWeightBold];
}


+ (void)load {
    // 获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    // 获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod, method);
}
+ (UIFont *)adjustFont:(CGFloat)fontSize {
    UIFont *newFont = nil;
    newFont = [UIFont adjustFont:fontSize * [UIScreen mainScreen].bounds.size.width/MyUIScreen];
    return newFont;
}
@end
