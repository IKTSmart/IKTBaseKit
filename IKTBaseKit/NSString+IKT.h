//
//  NSString+IKT.h
//  BCPro
//
//  Created by ETScorpion on 2018/9/6.
//  Copyright © 2018年 ETScorpion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IKT)

/*
 * MD5加密
 */
- (NSString *)MD5;

/*
 * 16位哈希加密 默认小写
 */
- (NSString *)MD5Hash16;

@end
