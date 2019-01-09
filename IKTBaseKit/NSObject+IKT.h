//
//  NSObject+IKT.h
//  BCPro
//
//  Created by ETScorpion on 2018/9/6.
//  Copyright © 2018年 ETScorpion. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 归档实现
 */
#define IKTCodingImplementation \
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self decode:decoder]; \
} \
return self; \
} \
\
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self encode:encoder]; \
}

@interface NSObject (IKT)

- (void)encode:(NSCoder *)encoder;

- (void)decode:(NSCoder *)decoder;

@end
