//
//  UIImage+IKT.h
//  BCDev
//
//  Created by ETScorpion on 2018/9/6.
//  Copyright © 2018年 ETScorpion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IKT)

/*
 * 获取图片主色
 */
- (UIColor*)mainColor;

/*
 * 使用功能color初始化图片
 */
+ (UIImage *)imageColor:(UIColor *)color size:(CGSize)size;

@end
