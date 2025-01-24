//
//  NSString+Frame.m
//  SmartHome
//
//  Created by 赵言 on 2019/7/16.
//  Copyright © 2019 赵言. All rights reserved.
//

#import "NSString+Frame.h"

@implementation NSString (Frame)

- (CGFloat)contentHeightWithFont:(UIFont *)font width:(CGFloat)width {
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.height;
}

- (CGFloat)contentWidthWithFont:(UIFont *)font height:(CGFloat)height {
    CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.width;
}

/**
 *  计算富文本的高度
 */
- (CGFloat)getAttributedStringHeightWithText:(NSAttributedString *)attributedString andWidth:(CGFloat)width andFont:(UIFont *)font {
    static UILabel *stringLabel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{//生成一个同于计算文本高度的label
        stringLabel = [[UILabel alloc] init];
        stringLabel.numberOfLines = 0;
    });
    stringLabel.font = font;
    stringLabel.attributedText = attributedString;
    return [stringLabel sizeThatFits:CGSizeMake(width, MAXFLOAT)].height;
}

- (NSAttributedString *)bot_attributedWithFont:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing {
    if (!self) {
        return nil;
    }
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    if (lineSpacing > 0) {
        style.lineSpacing = lineSpacing;
        style.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName: style, NSForegroundColorAttributeName: color}];
    return attributedString;
}
@end
