//
//  NSDate+stringFromUnixTime.m
//  nsstring
//
//  Created by Yuriy Berdnikov on 10/11/12.
//

#import "NSDate+stringFromUnixTime.h"

@implementation NSDate (stringFromUnixTime)

// f - 1, 21, 31, ...
// s - 2-4, 22-24, 32-34 ...
// t - 5-20, 25-30, ...
NSString* numpf(NSInteger number, NSString *f, NSString *s, NSString *t)
{
    NSInteger n10 = number % 10;
    
    if ((n10 == 1) && ((number == 1) || (number > 20)))
        return f;
    else if ((n10 > 1) && (n10 < 5) && ((number > 20) || (number < 10) ))
        return s;
    else
        return t;
}

+ (NSString *)timeStringFromUnixTime:(NSTimeInterval)timestamp
{
    NSDate *postedDate = [[NSDate alloc] initWithTimeIntervalSince1970:timestamp];
    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:postedDate];
    
    if (!interval)
        return nil;
    
    NSInteger minute = 60;
    NSInteger hour = 60 * minute;
    NSInteger day = 24 * hour;
    NSInteger month = 30 * day;
    
    if (interval < 2 * minute)
        return NSLocalizedString(@"a minute ago", @"a minute ago");
    if (interval < hour)
    {
        return [NSString stringWithFormat:@"%d %@", (int)interval / minute,
                numpf((int)interval / minute,
                      NSLocalizedString(@"one min ago", @"Text for minute (1, 21, 31)"),
                      NSLocalizedString(@"2-4 min ago", @"Text for minute in range 2-4"),
                      NSLocalizedString(@"5-10 min ago", @"Text for minute in range 5-10"))];
    }
    if (interval < 2 * hour)
        return [NSString stringWithFormat:@"%d %@", (int)interval / hour, NSLocalizedString(@"hour ago", @"hour ago")];
    if (interval < day)
    {
        return [NSString stringWithFormat:@"%d %@", (int)interval / hour,
                numpf((int)interval / hour,
                      NSLocalizedString(@"one hour ago", @"Text for hour (1, 21, 31)"),
                      NSLocalizedString(@"2-4 hour ago", @"Text for hour in range 2-4"),
                      NSLocalizedString(@"5-10 hour ago", @"Text for hour in range 5-10"))];
    }
    if (interval < 48 * hour)
        return NSLocalizedString(@"yesterday", @"yesterday");
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    if (interval < 12 * month)
        [dateFormat setDateFormat:@"dd MMM"];
    else
        [dateFormat setDateFormat:@"dd MMM YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:postedDate];
    
    [dateFormat release];
    [postedDate release];
    
    return dateString;
}

@end
