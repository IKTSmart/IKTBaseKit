//
//  NSObject+IKT.m
//  BCPro
//
//  Created by ETScorpion on 2018/9/6.
//  Copyright © 2018年 ETScorpion. All rights reserved.
//

#import "NSObject+IKT.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (IKT)

- (void)encode:(NSCoder *)encoder{
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    
    for (unsigned int i = 0; i < outCount; ++i) {
        Ivar ivar = ivars[i];
        
        // 获取成员变量名
        const void *name = ivar_getName(ivar);
        NSString *ivarName = [NSString stringWithUTF8String:name];
        // 去掉成员变量的下划线
        ivarName = [ivarName substringFromIndex:1];
        
        // 获取getter方法
        SEL getter = NSSelectorFromString(ivarName);
        if ([self respondsToSelector:getter]) {
            const void *typeEncoding = ivar_getTypeEncoding(ivar);
            NSString *type = [NSString stringWithUTF8String:typeEncoding];
            
            // const void *
            if ([type isEqualToString:@"r^v"]) {
                const char *value = ((const void *(*)(id, SEL))(void *)objc_msgSend)((id)self, getter);
                NSString *utf8Value = [NSString stringWithUTF8String:value];
                [encoder encodeObject:utf8Value forKey:ivarName];
                continue;
            }
            // int
            else if ([type isEqualToString:@"i"]) {
                int value = ((int (*)(id, SEL))(void *)objc_msgSend)((id)self, getter);
                [encoder encodeObject:@(value) forKey:ivarName];
                continue;
            }
            //short
            else if ([type isEqualToString:@"s"]) {
                short value = ((short (*)(id, SEL))(void *)objc_msgSend)((id)self, getter);
                [encoder encodeObject:@(value) forKey:ivarName];
                continue;
            }
            // float
            else if ([type isEqualToString:@"f"]) {
                float value = ((float (*)(id, SEL))(void *)objc_msgSend)((id)self, getter);
                [encoder encodeObject:@(value) forKey:ivarName];
                continue;
            }
            // double
            else if ([type isEqualToString:@"d"]) {
                double value = ((double (*)(id, SEL))(void *)objc_msgSend)((id)self, getter);
                [encoder encodeObject:@(value) forKey:ivarName];
                continue;
            }
            // long
            else if ([type isEqualToString:@"l"]) {
                long value = ((long (*)(id, SEL))(void *)objc_msgSend)((id)self, getter);
                [encoder encodeObject:@(value) forKey:ivarName];
                continue;
            }
            // long long
            else if ([type isEqualToString:@"q"]) {
                long long value = ((long long (*)(id, SEL))(void *)objc_msgSend)((id)self, getter);
                [encoder encodeObject:@(value) forKey:ivarName];
                continue;
            }
            // Bool
            else if ([type isEqualToString:@"B"]){
                bool value = ((bool (*)(id, SEL))(void *)objc_msgSend)((id)self, getter);
                [encoder encodeObject:@(value) forKey:ivarName];
                continue;
            }
            // char
            else if ([type isEqualToString:@"c"]){
                char value = ((char (*)(id, SEL))(void *)objc_msgSend)((id)self, getter);
                [encoder encodeObject:@(value) forKey:ivarName];
                continue;
            }
            
            id value = ((id (*)(id, SEL))(void *)objc_msgSend)((id)self, getter);
            if (value != nil && [value respondsToSelector:@selector(encodeWithCoder:)]) {
                [encoder encodeObject:value forKey:ivarName];
            }
        }
    }
    
    free(ivars);
}

- (void)decode:(NSCoder *)decoder{

    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    
    for (unsigned int i = 0; i < outCount; ++i) {
        Ivar ivar = ivars[i];
        
        // 获取成员变量名
        const void *name = ivar_getName(ivar);
        NSString *ivarName = [NSString stringWithUTF8String:name];
        // 去掉成员变量的下划线
        ivarName = [ivarName substringFromIndex:1];
        // 生成setter格式
        NSString *setterName = ivarName;
        // 那么一定是字母开头
        if (![setterName hasPrefix:@"_"]) {
            NSString *firstLetter = [NSString stringWithFormat:@"%c", [setterName characterAtIndex:0]];
            setterName = [setterName substringFromIndex:1];
            setterName = [NSString stringWithFormat:@"%@%@", firstLetter.uppercaseString, setterName];
        }
        setterName = [NSString stringWithFormat:@"set%@:", setterName];
        // 获取getter方法
        SEL setter = NSSelectorFromString(setterName);
        if ([self respondsToSelector:setter]) {
            const void *typeEncoding = ivar_getTypeEncoding(ivar);
            NSString *type = [NSString stringWithUTF8String:typeEncoding];
            
            // const void *
            if ([type isEqualToString:@"r^v"]) {
                NSString *value = [decoder decodeObjectForKey:ivarName];
                if (value) {
                    ((void (*)(id, SEL, const void *))objc_msgSend)(self, setter, value.UTF8String);
                }
                
                continue;
            }
            // int
            else if ([type isEqualToString:@"i"]) {
                NSNumber *value = [decoder decodeObjectForKey:ivarName];
                if (value != nil) {
                    ((void (*)(id, SEL, int))objc_msgSend)(self, setter, [value intValue]);
                }
                continue;
            }
            // float
            else if ([type isEqualToString:@"f"]) {
                NSNumber *value = [decoder decodeObjectForKey:ivarName];
                if (value != nil) {
                    ((void (*)(id, SEL, float))objc_msgSend)(self, setter, [value floatValue]);
                }
                continue;
            }
            //short
            else if ([type isEqualToString:@"s"]) {
                NSNumber *value = [decoder decodeObjectForKey:ivarName];
                if (value != nil) {
                    ((void (*)(id, SEL, short))objc_msgSend)(self, setter, [value floatValue]);
                }
                continue;
            }
            // double
            else if ([type isEqualToString:@"d"]) {
                NSNumber *value = [decoder decodeObjectForKey:ivarName];
                if (value != nil) {
                    ((void (*)(id, SEL, double))objc_msgSend)(self, setter, [value floatValue]);
                }
                continue;
            }
            // long
            else if ([type isEqualToString:@"l"]) {
                NSNumber *value = [decoder decodeObjectForKey:ivarName];
                if (value != nil) {
                    ((void (*)(id, SEL, long))objc_msgSend)(self, setter, [value floatValue]);
                }
                continue;
            }
            // long long
            else if ([type isEqualToString:@"q"]) {
                NSNumber *value = [decoder decodeObjectForKey:ivarName];
                if (value != nil) {
                    ((void (*)(id, SEL, long long))objc_msgSend)(self, setter, [value floatValue]);
                }
                continue;
            }
            // Bool
            else if ([type isEqualToString:@"B"]){
                NSNumber *value = [decoder decodeObjectForKey:ivarName];
                if (value != nil) {
                    ((void (*)(id, SEL, bool))objc_msgSend)(self, setter, [value floatValue]);
                }
                continue;
            }
            // char
            else if ([type isEqualToString:@"c"]){
                NSNumber *value = [decoder decodeObjectForKey:ivarName];
                if (value != nil) {
                    ((void (*)(id, SEL, char))objc_msgSend)(self, setter, [value floatValue]);
                }
                continue;
            }
            
            // object
            id value = [decoder decodeObjectForKey:ivarName];
            @try {

                if (value != nil) {
                    ((void (*)(id, SEL, id))objc_msgSend)(self, setter, value);
                }
            } @catch (NSException *exception) {
                NSLog(@"%@ %@ unknow type save faild",type,value);
            } @finally {}
        }
    }
    
    free(ivars);
}

@end
