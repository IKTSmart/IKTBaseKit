//
//  NSString+IKT.m
//  BCPro
//
//  Created by ETScorpion on 2018/9/6.
//  Copyright © 2018年 ETScorpion. All rights reserved.
//

#import "NSString+IKT.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (IKT)

- (NSString *)MD5{

    if (!self) return nil;
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, (CC_LONG)data.length, result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],  result[1],  result[2],  result[3],
            result[4],  result[5],  result[6],  result[7],
            result[8],  result[9],  result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)MD5Hash{
    
    const char *original_str = [self UTF8String];
    
    unsigned char result[16];
    
    CC_MD5(original_str, (unsigned int)strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < 16; i++)
        
        [hash appendFormat:@"%02X", result[i]];
    
    return [hash lowercaseString];
}


- (NSString *)MD5Hash16{
    
    NSString *oringialStr = [self MD5Hash];
    return [oringialStr substringWithRange:NSMakeRange(8, 16)];
}

@end
