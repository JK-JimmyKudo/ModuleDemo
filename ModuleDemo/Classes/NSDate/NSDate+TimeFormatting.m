//
//  NSDate+TimeFormatting.m
//  SmartHome
//
//  Created by 赵言 on 2019/7/15.
//  Copyright © 2019 赵言. All rights reserved.
//

#import "NSDate+TimeFormatting.h"

@implementation NSDate (TimeFormatting)

- (NSString *)stringFromDateWithFormat:(NSString *)format {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [df setTimeZone:timeZone];
    df.dateFormat = format;
    return [df stringFromDate:self];
}

- (NSInteger)timeSwitchTimestamp {
    return [[NSNumber numberWithDouble:[self timeIntervalSince1970]] integerValue];
}

//- (NSInteger)currentTimeToTimeStamp{
//    
//}

///将时间戳转为日期时间
 
/// @param timestamp 时间戳
 
/// @param dateFormat 日期样式 YYYY-MM-dd HH:mm:ss
 
+ (NSString *)getTimeFromTimestamp:(NSInteger )timestamp andDateFormat:(NSString *)dateFormat{
    //将对象类型的时间转换为NSDate类型
    NSDate * myDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
    //设置时间格式
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:dateFormat];
     //将时间转换为字符串
     NSString *timeStr = [formatter stringFromDate:myDate];
    return timeStr;
}

/// 将当天0点到当前的时间分为一个小时一段的字符串数组，例如@[@“00:00-01:00”]
+ (NSArray<NSString *> *)timeSegmentsFromMidnightToNow {
    // 获取当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 设置时区，如果需要的话
//     calendar.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
  
    // 获取当前日期和时间
    NSDate *now = [NSDate date];
    // 获取今天的开始时间（即00:00:00）
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:now];
    NSDate *midnight = [calendar dateFromComponents:components];
  
    // 计算两个时间之间的秒数
    NSTimeInterval secondsFromMidnight = [now timeIntervalSinceDate:midnight];
    // 计算小时数
    NSInteger hoursPassed = (NSInteger)(secondsFromMidnight / 3600);
  
    // 创建时间段数组
    NSMutableArray *segments = [NSMutableArray array];
    for (int i = 0; i <= hoursPassed; i++) {
        // 格式化时间
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"HH:mm";
          
        // 计算当前小时的开始时间
        NSDate *start = [calendar dateByAddingUnit:NSCalendarUnitHour value:i toDate:midnight options:0];
        // 计算当前小时的结束时间（下一个小时的开始时间，但需要减一秒以避免包含下一个小时的开始时刻）
//        NSDate *end = [calendar dateByAddingUnit:NSCalendarUnitHour value:i+1 toDate:midnight options:0];
//        if (i == hoursPassed) {
//            // 如果是最后一个时间段，则结束时间使用当前时间
//            end = now;
//        } else {
//            // 否则，结束时间减去一秒
//            NSTimeInterval interval = [end timeIntervalSinceDate:start];
//            end = [start dateByAddingTimeInterval:interval];
//        }
        // 计算结束时间
        NSDate *end;
        if (i < hoursPassed) {
            // 不是最后一个时间段，结束时间为下一个小时的开始
            end = [calendar dateByAddingUnit:NSCalendarUnitHour value:i+1 toDate:midnight options:0];
        } else {
            // 是最后一个时间段，结束时间为当天的下一个整点（或者简单地使用23:59:59，如果你不想跨越日期）
            // 但为了简单起见，我们使用当天的下一个整点
            end = [calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:start options:0];
            // 然后减去一秒以确保它仍然是今天的日期（但这不是必需的，因为我们只是要格式化显示）
            // 实际上，我们可以直接使用下一个整点的时间，无需减去一秒
            // end = [end dateByAddingTimeInterval:-1]; // 这行可以省略
            // 但为了精确到分钟，我们可以只设置小时和分钟
            components = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:end];
            [components setHour:i+1];
            [components setMinute:0];
            [components setSecond:0];
            end = [calendar dateFromComponents:components];
        }
  
        // 添加到数组
        NSString *segment = [NSString stringWithFormat:@"%@-%@", [formatter stringFromDate:start], [formatter stringFromDate:end]];
        [segments addObject:segment];
    }
  
    return segments;
}

/// 获取今天0点的时间字符串 //@"yyyy-MM-dd HH:mm:ss"
- (NSString*)getTheDayStartTimeWithFormat:(nonnull NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSCalendar *calendar = [NSCalendar currentCalendar];

    // 获取当前日期的组件
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];

    // 设置时间为零点
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];

    // 获取今天零点的日期对象
    NSDate *midnightDate = [calendar dateFromComponents:components];

    // 将日期对象转换为字符串
    NSString *midnightString = [dateFormatter stringFromDate:midnightDate];

    NSLog(@"%@", midnightString);
    if (!midnightString) {
        midnightString = @"";
    }
    return midnightString;
}

/// 获取今天23:59:59的时间字符串
- (NSString*)getTheDayEndTimeWithFormat:(nonnull NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSCalendar *calendar = [NSCalendar currentCalendar];

    // 为当前日期增加一天
//    NSDate *tomorrowDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:self options:0];

    // 获取明天零点的日期组件
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];

    // 设置时间为零点
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];

    // 获取明天零点的日期对象
    NSDate *midnightDate = [calendar dateFromComponents:components];

    // 将日期对象转换为字符串
    NSString *midnightString = [dateFormatter stringFromDate:midnightDate];

    NSLog(@"%@", midnightString);
    if (!midnightString) {
        midnightString = @"";
    }
    return midnightString;
}

/// 时间@"05:00" 转换成成 @“2024-08-22 05:00:00”
+ (NSString *)convertToFullDateTimeString:(NSString *)timeString {
  
    // 获取当前日期
    NSDate *now = [NSDate date];
      
    // 设置日期时间格式化器用于输出
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    outputFormatter.dateFormat = @"yyyy-MM-dd"; // 输出的日期时间格式
    outputFormatter.timeZone = [NSTimeZone localTimeZone];
    
    NSString *day = [outputFormatter stringFromDate:now];
    
    NSString *fullDateTime = [NSString stringWithFormat:@"%@ %@:00",day,timeString];
   // 格式化并返回完整的日期时间字符串
    return fullDateTime;
}

/// 日期数组按日期先后排序，isForwardSort:Yes 正序（小时间在前）， NO 倒序(大时间在前)
+ (NSArray *)sortDaysArray:(NSArray *)days isForwardSort:(BOOL)isForwardSort formatter:(NSString *)formatterString
{
    //// 创建一个日期格式化器
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterString];
    
    // 使用sortedArrayUsingComparator:来排序，通过比较转换后的NSDate对象
    if (isForwardSort) {
        NSArray *sortedDates = [days sortedArrayUsingComparator:^NSComparisonResult(NSString * _Nonnull obj1, NSString * _Nonnull obj2) {
            NSDate *date1 = [formatter dateFromString:obj1];
            NSDate *date2 = [formatter dateFromString:obj2];
            return [date1 compare:date2];
        }];
    
        return sortedDates;
    } else {
        NSArray *sortedDates = [days sortedArrayUsingComparator:^NSComparisonResult(NSString * _Nonnull obj1, NSString * _Nonnull obj2) {
            NSDate *date1 = [formatter dateFromString:obj1];
            NSDate *date2 = [formatter dateFromString:obj2];
            return [date2 compare:date1];
        }];
    
        return sortedDates;
    }
}

@end
