//
//  IKTHandler.m
//  BCDev
//
//  Created by ETScorpion on 2018/9/6.
//  Copyright © 2018年 ETScorpion. All rights reserved.
//

#import "IKTHandler.h"
#import <UIKit/UIKit.h>

@implementation IKTHandler

#pragma mark Time About
/*
 * 获取某一天零点时间戳
 */
NSTimeInterval timestmpDayStart(NSDate *date){
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    NSDate *startDate = [calendar dateFromComponents:components];
    return [startDate timeIntervalSince1970];
}

/*
 * 获取周几
 * 1周天 2周一 ....
 */
NSInteger weekDayDate(NSDate *date){
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    return [comps weekday];
}

/*
 * 获取本月第一天零点和最后一天最后一刻的时间
 */
NSArray * monthFirstLastDay(NSDate *date){
    
    double interval = 0;
    NSDate *firstDate = nil;
    NSDate *lastDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    BOOL OK = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&firstDate interval:&interval forDate:date];
    if (OK) {
        lastDate = [firstDate dateByAddingTimeInterval:interval - 1];
    }else {
        return nil;
    }
    return @[firstDate,lastDate];
}

/*
 * 时间转换字符串 到天
 */
NSString * dateToString_Day(NSDate *date){
    
    NSString *string = datetToString(date, @"yyyy-MM-dd");
    return string;
}

/*
 * 字符串转换时间 到天
 */
NSDate * stringToDate_Day(NSString *string){
    
    NSDate *date = stringToDate(string, @"yyyy-MM-dd");
    return date;
}

/*
 * 时间转换字符串 到秒
 */
NSString * dateToString_Second(NSDate *date){
    
    NSString *string = datetToString(date, @"yyyy-MM-dd HH:mm:ss");
    return string;
}

/*
 * 字符串转换时间 到秒
 */
NSDate * stringToDate_Second(NSString *string){
    
    NSDate *date = stringToDate(string, @"yyyy-MM-dd HH:mm:ss");
    return date;
}

/*
 * 时间转换字符串 自定义
 */
NSString * datetToString(NSDate *date, NSString *style){
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:style];
    NSString *string = [formatter stringFromDate:date];
    return string;
}

/*
 * 字符串转换时间 自定义
 */
NSDate * stringToDate(NSString *string, NSString *style){
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:style];
    NSDate *date = [formatter dateFromString:string];
    return date;
}

/*
 * 获取当前时间戳
 */
+ (NSString *)TimeStmp{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%ld",(long)time];
}

#pragma Mark App About

/*
 * 获取iOS版本
 */
float iOSVersion(void){
    float iosVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    return iosVersion;
}

/*
 * 获取app版本
 */
NSString * IKTAppVersion(void){
    static NSString *version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    });

    return version;
}

/*
 * 获取app版本不带.
 */
NSString * IKTAppVersionNoPoint(void){
    static NSString *versionNoPoint;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        versionNoPoint = replacePoint([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]);
    });
    
    return versionNoPoint;
}

/*
 * 获取app build版本
 */
NSString * IKTAppBildVersion(void){
    static NSString *buildVersion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        buildVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    });
    
    return buildVersion;
}

/*
 * 获取app build版本不带.
 */
NSString * IKTAppBildVersionNoPoint(void){
    static NSString *buildversionNoPoint;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        buildversionNoPoint = replacePoint([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]);
    });
    
    return buildversionNoPoint;
}

/*
 * 设备序列号
 */
NSString * IKTDeviceUUID(void){
    static NSString *deviceIdentifier;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    });
    return deviceIdentifier;
}

/*
 * 手机自定义名称
 */
NSString *IKTPhoneName(void){
    static NSString *phoneName;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        phoneName = [[UIDevice currentDevice] name];
    });
    return phoneName;
}

/*
 * 设备名称
 */
NSString *IKTDeviceName(void){
    static NSString *deviceName;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceName = [[UIDevice currentDevice] systemName];
    });
    return deviceName;
}

/*
 * 手机型号
 */
NSString *IKTDeveceType(void){
    static NSString *deviceType;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceType = [[UIDevice currentDevice] model];
    });
    return deviceType;
}

/*
 * 国际化区域名称
 */
NSString *IKTLocalizeModel(void){
    static NSString *localizeModel;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localizeModel = [[UIDevice currentDevice] localizedModel];
    });
    return localizeModel;
}

/*
 * 打开应用设置
 */
+ (void)OpenAppSettingParamer:(NSDictionary *)paramer Completion:(void(^)(BOOL success))completion{
    
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if (![[UIApplication sharedApplication] canOpenURL:url]) return;
        
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url options:paramer completionHandler:completion];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [[UIApplication sharedApplication] openURL:url];
#pragma clang diagnostic pop
    }
}

/*
 * 打电话
 */
+ (void)CallPhone:(NSString *)phone Paramer:(NSDictionary *)paramer Completion:(void(^)(BOOL success))completion{
    
    if (!phone) {
        return;
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phone]];
    if (![[UIApplication sharedApplication] canOpenURL:url]) return;
    
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url options:paramer completionHandler:completion];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [[UIApplication sharedApplication] openURL:url];
#pragma clang diagnostic pop
    }
}

/*
 * 检测模拟器
 */
BOOL CheckSimulator(void){
#if TARGET_IPHONE_SIMULATOR//模拟器
    return YES;
#elif TARGET_OS_IPHONE//真机
    return NO;
#endif
}

#pragma mark Data About

/*
 * 检查特殊字符
 * YES包含
 */
BOOL CheckCharacterSpecial(NSString *character){

    NSString *regularString =@"[a-z|A-Z0-9|\u4e00-\u9fa5]+";
    return !CheckCharacter(character, regularString);
}

/*
 * 检查是否为纯数字
 * @YES 纯数字
 */
BOOL CheckCharacterIsNumber(NSString *character){
    
    NSString *regularString =@"[0-9]+";
    return CheckCharacter(character, regularString);
}

/*
 * 检测是否只有字母或数字
 * @YES
 */
BOOL CheckCharacterIsLetterOrNumber(NSString *character){
    
    NSString *regularPredicate = @"[0-9|a-zA-Z]+";
    return CheckCharacter(character, regularPredicate);
}

/*
 * 按照规则检查是否符合
 * @YES 符合
 */
BOOL CheckCharacter(NSString *character, NSString *regular){
    
    if (!character) {
        return NO;
    }
    NSPredicate *regularPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
    if ([regularPredicate evaluateWithObject:character]) {
        return YES;
    }
    return NO;
}

#pragma mark Private
/*
 * 字符串过滤掉 .
 */
NSString * replacePoint(NSString *string){
    if (string.length==0) {
        return @"";
    }
    return [string stringByReplacingOccurrencesOfString:@"." withString:@""];
}

@end
