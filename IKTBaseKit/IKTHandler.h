//
//  IKTHandler.h
//  BCDev
//
//  Created by ETScorpion on 2018/9/6.
//  Copyright © 2018年 ETScorpion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IKTHandler : NSObject

#pragma mark Time About
/*
 * 时间转换
 */
//获取某一天零点时间戳
NSTimeInterval timestmpDayStart(NSDate *date);
//获取周几
NSInteger weekDayDate(NSDate *date);
//获取本月第一天零点和最后一天最后一刻的时间
NSArray * monthFirstLastDay(NSDate *date);
//时间转换字符串 到天
NSString * dateToString_Day(NSDate *date);
//字符串转换时间 到天
NSDate * stringToDate_Day(NSString *string);
//时间转换字符串 到秒
NSString * dateToString_Second(NSDate *date);
//字符串转换时间 到秒
NSDate * stringToDate_Second(NSString *string);
//时间转换字符串 自定义
NSString * datetToString(NSDate *date, NSString *style);
//字符串转换时间 自定义
NSDate * stringToDate(NSString *string, NSString *style);

/*
 * 获取当前时间戳
 */
+ (NSString *)TimeStmp;

#pragma Mark App About

/*
 * 获取iOS版本
 */
float iOSVersion(void);

/*
 * 获取app版本
 */
NSString * IKTAppVersion(void);

/*
 * 获取app版本不带.
 */
NSString * IKTAppVersionNoPoint(void);

/*
 * 获取app build版本
 */
NSString * IKTAppBildVersion(void);

/*
 * 获取app build版本不带.
 */
NSString * IKTAppBildVersionNoPoint(void);

/*
 * 设备识别号(重装发生变化)
 */
NSString * IKTDeviceUUID(void);

/*
 * 手机自定义名称
 */
NSString *IKTPhoneName(void);

/*
 * 设备名称
 */
NSString *IKTDeviceName(void);

/*
 * 手机型号
 */
NSString *IKTDeveceType(void);

/*
 * 国际化区域名称
 */
NSString *IKTLocalizeModel(void);

/*
 * 打开应用设置
 */
+ (void)OpenAppSettingParamer:(NSDictionary *)paramer Completion:(void(^)(BOOL success))completion;

/*
 * 打电话
 */
+ (void)CallPhone:(NSString *)phone Paramer:(NSDictionary *)paramer Completion:(void(^)(BOOL success))completion;

/*
 * 检测模拟器
 * @YES模拟器
 */
BOOL CheckSimulator(void);

#pragma mark Data About

/*
 * 检查特殊字符
 * @YES包含
 */
BOOL CheckCharacterSpecial(NSString *character);

/*
 * 检查是否为纯数字
 */
BOOL CheckCharacterIsNumber(NSString *character);

/*
 * 检测是否只有字母或数字
 * @YES
 */
BOOL CheckCharacterIsLetterOrNumber(NSString *character);

/*
 * 按照规则检查是否符合
 * @YES 符合
 */
BOOL CheckCharacter(NSString *character, NSString *regular);

@end
