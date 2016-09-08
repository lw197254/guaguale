//
//  CarBezierPathView.m
//  GuaJiang
//
//  Created by 刘伟 on 16/8/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "CarBezierPathView.h"

@implementation CarBezierPathView
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
}
-(void)setArray:(NSArray *)array{
    _array = array;
    if (!_array) {
        return;
    }
    UIBezierPath*bezierPath = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    [_array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGPoint point = [obj CGPointValue];
        if (idx == 0) {
            [bezierPath moveToPoint:point];
        }else{
            [bezierPath addLineToPoint:point];
        }
        
        
    }];
    layer.path = bezierPath.CGPath;
    layer.fillColor  = [UIColor blackColor].CGColor;
    layer.strokeColor = [UIColor greenColor].CGColor;
    [self.layer addSublayer:layer];
    
}
@end
