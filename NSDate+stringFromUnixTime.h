//
//  NSDate+stringFromUnixTime.h
//  nsstring
//
//  Created by Yuriy Berdnikov on 10/11/12.
//

#import <Foundation/Foundation.h>

@interface NSDate (stringFromUnixTime)

//timestamp - unix timestamp in secconds
+ (NSString *)timeStringFromUnixTime:(NSTimeInterval)timestamp;

@end
