//
//  NSDate+TimeFormatting.h
//  SmartHome
//
//  Created by 赵言 on 2019/7/15.
//  Copyright © 2019 赵言. All rights reserved.
//  时间格式化

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (TimeFormatting)

/**
 NSDate转字符串

 @param format 时间格式，如：yyyy-MM-dd HH:mm:ss
 @return 时间字符串
 */
- (NSString *)stringFromDateWithFormat:(NSString *)format;

/// 时间转时间戳
- (NSInteger)timeSwitchTimestamp;

//- (NSInteger)currentTimeToTimeStamp;


///将时间戳转为日期时间
/// @param timestamp 时间戳
 
/// @param dateFormat 日期样式 YYYY-MM-dd HH:mm:ss
 
+ (NSString *)getTimeFromTimestamp:(NSInteger )timestamp andDateFormat:(NSString *)dateFormat;

/// 将当天0点到当前的时间分为一个小时一段的字符串数组，例如@[@“00:00-01:00”]
+ (NSArray<NSString *> *)timeSegmentsFromMidnightToNow;

/// 获取今天0点的时间字符串
- (NSString*)getTheDayStartTimeWithFormat:(nonnull NSString *)format;

/// 获取今天23:59:59的时间字符串
- (NSString*)getTheDayEndTimeWithFormat:(nonnull NSString *)format;

/// 时间@"05:00" 转换成成 @“2024-08-22 05:00:00”
+ (NSString *)convertToFullDateTimeString:(NSString *)timeString;

/// 日期数组按日期先后排序，isForwardSort:Yes 正序（小时间在前）， NO 倒序(大时间在前)
+ (NSArray *)sortDaysArray:(NSArray *)days isForwardSort:(BOOL)isForwardSort formatter:(NSString *)formatterString;


@end

NS_ASSUME_NONNULL_END
