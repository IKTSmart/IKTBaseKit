//
//  UIView+IKT.m
//  Demo
//
//  Created by ETScorpion on 2018/9/6.
//  Copyright © 2018年 ETScorpion. All rights reserved.
//

#import "UIView+IKT.h"

@implementation UIView (IKT)

- (void)setX:(CGFloat)x{
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX{
    self.center = CGPointMake(centerX, self.centerY);
}

- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY{
    self.center = CGPointMake(self.centerX, centerY);
}

- (CGFloat)centerY{
    return self.center.y;
}

- (void)setHeight:(CGFloat)height{
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setWidth:(CGFloat)width{
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setMaxX:(CGFloat)maxX{
    self.frame = CGRectMake(self.x, self.y, maxX-self.x, self.height);
}

- (CGFloat)maxX{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setMaxY:(CGFloat)maxY{
    self.frame = CGRectMake(self.x, self.y, self.width, maxY-self.y);
}

- (CGFloat)maxY{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)equalMaxX:(CGFloat)maxX{
    self.frame = CGRectMake(maxX-self.width, self.y, self.width, self.height);
}

- (void)equalMaxY:(CGFloat)maxY{
    self.frame = CGRectMake(self.x, maxY-self.height, self.width, self.height);
}

- (void)addTopBorder{
    
    [self addTopBorderColor:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
}

- (void)addTopBorderColor:(UIColor *)color{
    
    [self addTopBorderColor:color Range:MakeFloatRange(0, 1.0)];
}

- (void)addTopBorderColor:(UIColor *)color Range:(FloatRange)range{
    
    [self addTopBorderColor:color Range:range Width:.5];
}

- (void)addTopBorderColor:(UIColor *)color Range:(FloatRange)range Width:(CGFloat)borderWidth{
    
    CGFloat width = self.frame.size.width;
    [self addBorderFrame:CGRectMake(width*range.location, 0, width*range.length, borderWidth) Color:color];
}

- (void)addLeftBorder{
    
    [self addLeftBorder:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
}

- (void)addLeftBorder:(UIColor *)color{
    
    [self addLeftBorder:color Range:MakeFloatRange(0, 1.0)];
}

- (void)addLeftBorder:(UIColor *)color Range:(FloatRange)range{
    
    [self addLeftBorder:color Range:range Width:.5];
}

- (void)addLeftBorder:(UIColor *)color Range:(FloatRange)range Width:(CGFloat)borderWidth{
    
    CGFloat height = self.frame.size.height;
    [self addBorderFrame:CGRectMake(0, height*range.location, borderWidth, height*range.length) Color:color];
}

- (void)addButtomBorder{

    [self addButtomBorder:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
}

- (void)addButtomBorder:(UIColor *)color{
    
    [self addButtomBorder:color Range:MakeFloatRange(0, 1.0)];
}

- (void)addButtomBorder:(UIColor *)color Range:(FloatRange)range{
    
    [self addButtomBorder:color Range:range Width:.5];
}

- (void)addButtomBorder:(UIColor *)color Range:(FloatRange)range Width:(CGFloat)borderWidth{
    
    CGFloat width = self.frame.size.width;
    [self addBorderFrame:CGRectMake(width*range.location, self.frame.size.height-.5, width*range.length, borderWidth) Color:color];
}

- (void)addRightBorder{
    
    [self addRightBorder:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
}

- (void)addRightBorder:(UIColor *)color{
    
    [self addRightBorder:color Range:MakeFloatRange(0, 1.0)];
}

- (void)addRightBorder:(UIColor *)color Range:(FloatRange)range{
    
    [self addLeftBorder:color Range:range Width:.5];
}

- (void)addRightBorder:(UIColor *)color Range:(FloatRange)range Width:(CGFloat)borderWidth{
    
    CGFloat height = self.frame.size.height;
    [self addBorderFrame:CGRectMake(self.frame.size.width-.5, height*range.location, borderWidth, height*range.length) Color:color];
}

/*
 * 添加水平中线
 */
- (void)addHorizontalLine{
    
    [self addHorizontalLine:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
}

- (void)addHorizontalLine:(UIColor *)color{
    
    [self addHorizontalLine:color Range:MakeFloatRange(0, 1)];
}

- (void)addHorizontalLine:(UIColor *)color Range:(FloatRange)range{
    
    [self addHorizontalLine:color Range:range Width:.5];
}

- (void)addHorizontalLine:(UIColor *)color Range:(FloatRange)range Width:(CGFloat)borderWidth{
    
    CGFloat x = range.location*self.width;
    CGFloat w = range.length*self.width;
    [self addBorderFrame:CGRectMake(x, self.height*.5, w, borderWidth) Color:color];
}

/*
 * 添加垂直中线
 */
- (void)addVerticalLine{
    
    [self addVerticalLine:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
}

- (void)addVerticalLine:(UIColor *)color{
    
    [self addVerticalLine:color Range:MakeFloatRange(0, 1)];
}

- (void)addVerticalLine:(UIColor *)color Range:(FloatRange)range{
    
    [self addVerticalLine:color Range:range Width:.5];
}

- (void)addVerticalLine:(UIColor *)color Range:(FloatRange)range Width:(CGFloat)borderWidth{
    
    CGFloat y = self.height*range.location;
    CGFloat h = self.height*range.length;
    [self addBorderFrame:CGRectMake(self.width*.5, y, borderWidth, h) Color:color];
}

/*
 * 任意位置线
 */
- (void)addBorderFrame:(CGRect)frame Color:(UIColor *)color{
    CALayer *border = [CALayer layer];
    border.frame = frame;
    border.backgroundColor = color.CGColor;
    [self.layer addSublayer:border];
}

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
- (void)addDottedlineStart:(CGPoint)start End:(CGPoint)end{

    [self addDottedlineStart:start End:end Color:[UIColor grayColor]];
}

- (void)addDottedlineStart:(CGPoint)start End:(CGPoint)end Color:(UIColor *)color{
    
    [self addDottedlineStart:start End:end Color:color Width:1.0 Space:1.0 Length:1.0];
}
- (void)addDottedlineStart:(CGPoint)start End:(CGPoint)end Color:(UIColor *)color Width:(CGFloat)Width Space:(CGFloat)space Length:(CGFloat)length{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.position = CGPointMake(1, 2);
    shapeLayer.fillColor = nil;
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.lineWidth = Width;
    shapeLayer.lineJoin = kCALineJoinRound;
    NSString *spaceString = [NSString stringWithFormat:@"%f",space];
    NSString *lengthString = [NSString stringWithFormat:@"%f",length];
    shapeLayer.lineDashPattern = @[spaceString, lengthString];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, start.x, start.y);
    CGPathAddLineToPoint(path, NULL, end.x, end.y);
    shapeLayer.path = path;
    CGPathRelease(path);
    [self.layer addSublayer:shapeLayer];
}

@end
