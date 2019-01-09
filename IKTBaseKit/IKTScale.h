//
//  IKTScale.h
//  BCPro
//
//  Created by ETScorpion on 2018/9/6.
//  Copyright © 2018年 ETScorpion. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIFont;
@class UIColor;

@interface IKTScale : NSObject

/*
 * 屏幕宽度
 */
float ScreenWidth(void);

/*
 * 屏幕宽度
 */
float ScreenHeight(void);

/*
 * 安全区+navigationBar 高度
 */
float IKTSafeAreaNavigationHeight(void);

/*
 * 安全区+TabBar 高度
 */
float IKTSafeAreaTabBarHeight(void);

/*
 * 安全区高度
 */
float IKTSafeAreaHeight(void);

/*
 * 状态栏高度
 */
float IKTStateBarHeight(void);

/*
 * 导航栏高度 (导航+状态栏)
 */
float IKTNavigationStateHeight(void);

/*
 * 导航高度
 */
float IKTNavigationHeight(void);

/*
 * 操作栏高度
 */
float IKTTabbarHeight(void);

#pragma -- mark 适配相关

/*
 * 以宽度为基准等比例放大到当前屏幕尺寸的大小
 * 宽度比率 默认4.7
 */
float iOSW(float value);

/*
 * 以高度为基准等比放大到当前屏幕尺寸的大小
 * 高度比率 默认4.7
 */
float iOSH(float value);

/*
 * 字体大小
 */
UIFont * IKTFont(float size);
UIFont * IKTFontS(float size);
UIFont * IKTFontB(float size);
UIFont * IKTFontName(NSString *name, float size);

/*
 * 颜色
 */
UIColor * IKTColorHex(long hexColor);
UIColor * IKTColorHexa(long hexColor, float opacity);
UIColor * IKTColorHexStr(NSString *color);

@end
