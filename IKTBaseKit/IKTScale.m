//
//  IKTScale.m
//  BCPro
//
//  Created by ETScorpion on 2018/9/6.
//  Copyright © 2018年 ETScorpion. All rights reserved.
//

#import "IKTScale.h"
#import <UIKit/UIKit.h>

@implementation IKTScale

/*
 * 屏幕宽度
 */
float ScreenWidth(void){
    static float screenWidth;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        screenWidth = [UIScreen mainScreen].bounds.size.width;
    });
    return screenWidth;
}

/*
 * 屏幕高度
 */
float ScreenHeight(void){
    static float screenHeight;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        screenHeight = [UIScreen mainScreen].bounds.size.height;
    });
    return screenHeight;
}

/*
 * 安全区+navigationBar 高度
 */
float IKTSafeAreaNavigationHeight(void){
    static float contentHeight;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        contentHeight = [UIScreen mainScreen].bounds.size.height-IKTTabbarHeight();
    });
    return contentHeight;
}

/*
 * 安全区+TabBar 高度
 */
float IKTSafeAreaTabBarHeight(void){
    static float contentHeight;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        contentHeight = [UIScreen mainScreen].bounds.size.height-IKTNavigationHeight()-IKTStateBarHeight();
    });
    return contentHeight;
}

/*
 * 安全区高度
 */
float IKTSafeAreaHeight(void){
    static float safeHeight;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        safeHeight = [UIScreen mainScreen].bounds.size.height-IKTNavigationHeight()-IKTTabbarHeight()-IKTStateBarHeight();
    });
    return safeHeight;
}

/*
 * 状态栏高度
 */
float IKTStateBarHeight(void){
    static float stateBarHeight;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stateBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    });
    return stateBarHeight;
}

/*
 * 导航栏高度 (导航+状态栏)
 */
float IKTNavigationStateHeight(void){
    static float navigationHeight;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        navigationHeight = IKTNavigationHeight() + IKTStateBarHeight();
    });
    return navigationHeight;
}

/*
 * 导航高度
 */
float IKTNavigationHeight(void){
    static float navigationHeight;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UINavigationBar *navigation = [UINavigationBar new];
        [navigation sizeToFit];
        navigationHeight = navigation.frame.size.height;
    });
    return navigationHeight;
}

/*
 * 操作栏高度
 */

float IKTTabbarHeight(void){
    static float tabbarHeight;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        UITabBar *tabBar = [UITabBar new];
        [tabBar sizeToFit];
        CGFloat nomal = tabBar.frame.size.height;
        tabbarHeight = IKTStateBarHeight()==44 ?  nomal+34 : nomal;;
    });
    return tabbarHeight;
}

float iOSW(float value){
    static float iosw;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        iosw = [UIScreen mainScreen].bounds.size.width/375.0;
    });
    return iosw*value;
}

float iOSH(float value){
    static float iosh;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        iosh = [UIScreen mainScreen].bounds.size.height/667.0;
    });
    return iosh*value;
}

/*
 * 字体大小
 */
UIFont * IKTFont(float size){
    //苹方字体 9.0以后才有
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    //return [UIFont fontWithName:@"STHeitiSC-Light" size:size];
}

UIFont * IKTFontS(float size){
    //苹方字体 9.0以后才有 缩放后后大小
    return [UIFont fontWithName:@"PingFangSC-Regular" size:iOSW(size)];
}

UIFont * IKTFontB(float size){
    //    PingFangSC-Medium//粗体.SFUIText
    return [UIFont fontWithName:@"PingFangSC-Medium" size:iOSW(size)];
}

UIFont *IKTFontName(NSString *name, float size){
    return [UIFont fontWithName:name size:size];
}

/*
 * 颜色
 */
UIColor * IKTColorHex(long hexColor){
    return IKTColorHexa(hexColor, 1.0);
}

UIColor * IKTColorHexa(long hexColor, float opacity){
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

UIColor * IKTColorHexStr(NSString *color){
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // 判断前缀并剪切掉
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
