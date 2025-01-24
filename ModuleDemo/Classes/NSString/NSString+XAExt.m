//
//  NSString+XAExt.m
//  HealthCompanionIOS
//
//  Created by llj on 2024/10/14.
//

#import "NSString+XAExt.h"

@implementation NSString (XAExt)
/// 是否为空
- (bool)isEmpty{

    
    if (self == nil || self == NULL || [self isKindOfClass:[NSNull class]] || [self length] == 0 || [self isEqualToString: @"(null)"]) {
        return true;
    }
    if ([self isKindOfClass:[NSNull class]]){
        return true;
    }
    return false;
}
@end
