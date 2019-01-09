//
//  UIView+IKT.h
//  Demo
//
//  Created by ETScorpion on 2018/9/6.
//  Copyright © 2018年 ETScorpion. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct {
    CGFloat location;
    CGFloat length;
} FloatRange;

typedef FloatRange *FloatRangePointer;

NS_INLINE FloatRange MakeFloatRange(CGFloat loc, CGFloat len) {
    FloatRange r;
    r.location = loc;
    r.length = len;
    return r;
}

@interface UIView (IKT)

/*
 * 最左边值
 */
@property (nonatomic, assign) CGFloat x;

/*
 * 顶部值
 */
@property (nonatomic, assign) CGFloat y;

/*
 * 中心点X值
 */
@property (nonatomic, assign) CGFloat centerX;

/*
 * 中心点Y值
 */
@property (nonatomic, assign) CGFloat centerY;

/*
 * 高度
 */
@property (nonatomic, assign) CGFloat height;

/*
 * 宽度
 */
@property (nonatomic, assign) CGFloat width;

/*
 * 最右边值 .maxX拉伸宽度
 */
@property (nonatomic, assign) CGFloat maxX;

/*
 * 底部值 .maxY拉伸高度
 */
@property (nonatomic, assign) CGFloat maxY;

/*
 * 等宽设置maxX
 */
- (void)equalMaxX:(CGFloat)maxX;

/*
 * 等高设置maxY
 */
- (void)equalMaxY:(CGFloat)maxY;

/*
 * 添加上边
 */
- (void)addTopBorder;
- (void)addTopBorderColor:(UIColor *)color;
- (void)addTopBorderColor:(UIColor *)color Range:(FloatRange)range;
- (void)addTopBorderColor:(UIColor *)color Range:(FloatRange)range Width:(CGFloat)borderWidth;

/*
 * 添加左边
 */
- (void)addLeftBorder;
- (void)addLeftBorder:(UIColor *)color;
- (void)addLeftBorder:(UIColor *)color Range:(FloatRange)range;
- (void)addLeftBorder:(UIColor *)color Range:(FloatRange)range Width:(CGFloat)borderWidth;

/*
 * 添加下边
 */
- (void)addButtomBorder;
- (void)addButtomBorder:(UIColor *)color;
- (void)addButtomBorder:(UIColor *)color Range:(FloatRange)range;
- (void)addButtomBorder:(UIColor *)color Range:(FloatRange)range Width:(CGFloat)borderWidth;

/*
 * 添加右边
 */
- (void)addRightBorder;
- (void)addRightBorder:(UIColor *)color;
- (void)addRightBorder:(UIColor *)color Range:(FloatRange)range;
- (void)addRightBorder:(UIColor *)color Range:(FloatRange)range Width:(CGFloat)borderWidth;

/*
 * 添加水平中线
 */
- (void)addHorizontalLine;
- (void)addHorizontalLine:(UIColor *)color;
- (void)addHorizontalLine:(UIColor *)color Range:(FloatRange)range;
- (void)addHorizontalLine:(UIColor *)color Range:(FloatRange)range Width:(CGFloat)borderWidth;

/*
 * 添加垂直中线
 */
- (void)addVerticalLine;
- (void)addVerticalLine:(UIColor *)color;
- (void)addVerticalLine:(UIColor *)color Range:(FloatRange)range;
- (void)addVerticalLine:(UIColor *)color Range:(FloatRange)range Width:(CGFloat)borderWidth;

/*
 * 任意位置线
 */
- (void)addBorderFrame:(CGRect)frame Color:(UIColor *)color;

/*
 *添加虚线
 * paramers
 * @start  起点
 * @end    终点
 * @color  虚线颜色
 @ @width  虚线线宽度
 @ @space  虚线空白处间隔
 @ @length 虚线着色一次长度
 */
- (void)addDottedlineStart:(CGPoint)start End:(CGPoint)end;
- (void)addDottedlineStart:(CGPoint)start End:(CGPoint)end Color:(UIColor *)color;
- (void)addDottedlineStart:(CGPoint)start End:(CGPoint)end Color:(UIColor *)color Width:(CGFloat)Width Space:(CGFloat)space Length:(CGFloat)length;


@end
