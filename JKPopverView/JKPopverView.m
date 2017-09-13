//
//  JKPopverView.m
//  TipsPopverView
//
//  Created by Miao on 2017/7/28.
//  Copyright © 2017年 Miao. All rights reserved.
//

#import "JKPopverView.h"
#import "UIView+Frame.h"

#import "JKPopverView.h"
#import "UIView+Frame.h"

@interface JKPopverView()

@property (nonatomic, strong) UILabel *tipsLabel;

@property (nonatomic, strong) CAShapeLayer *triangleLayer;

@end

@implementation JKPopverView

- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.backgroundColor = [UIColor redColor];
        _tipsLabel.textAlignment = NSTextAlignmentCenter;
        _tipsLabel.numberOfLines = 0;
        _tipsLabel.textColor = [UIColor whiteColor];
        _tipsLabel.font = [UIFont systemFontOfSize:12];
    }
    return  _tipsLabel;
}

- (void)addTriangleRelateView:(UIView *)view {
    if (!_triangleLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(view.width / 2.0 - 8, view.height - 1)];
        [path addLineToPoint:CGPointMake(view.width / 2.0, view.height + 10)];
        [path addLineToPoint:CGPointMake(view.width / 2.0 + 8, view.height -1)];
        _triangleLayer = [CAShapeLayer layer];
        _triangleLayer.path = path.CGPath;
        _triangleLayer.fillColor = view.backgroundColor.CGColor;
        [self.layer addSublayer:_triangleLayer];
    }
}

- (void)addTriangleRelateViewTop:(UIView *)view {
    if (!_triangleLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(view.width / 2.0 - 5, 1)];
        [path addLineToPoint:CGPointMake(view.width / 2.0, -7)];
        [path addLineToPoint:CGPointMake(view.width / 2.0 + 5, 1)];
        _triangleLayer = [CAShapeLayer layer];
        _triangleLayer.path = path.CGPath;
        _triangleLayer.fillColor = view.backgroundColor.CGColor;
        [self.layer addSublayer:_triangleLayer];
    }
}

- (void)adjustBoundsWithMaxWidth:(CGFloat)maxWidth {
    [_tipsLabel sizeToFit];
    if (_tipsLabel.width >= maxWidth) {
        _tipsLabel.width = maxWidth - 10 * 2;
    }
    [_tipsLabel sizeToFit];
    
    self.width = _tipsLabel.width + 18;
    self.height = _tipsLabel.height + 14;
    _tipsLabel.center = CGPointMake(self.width / 2, self.height /2);
    [self addSubview:self.tipsLabel];
    [self addTriangleRelateViewTop:self];
}

+ (JKPopverView *)showText:(NSString *)text inView:(UIView *)superView relateView:(UIView *)relateView {
    JKPopverView *popoverView = [[JKPopverView alloc] init];
    popoverView.backgroundColor = popoverView.tipsLabel.backgroundColor;
    popoverView.tipsLabel.text = text;
    popoverView.layer.cornerRadius = 15;
    [superView addSubview:popoverView];
    
    CGFloat minWidth = MIN(relateView.x + relateView.width / 2.0, superView.width - (relateView.x + relateView.width / 2.0));
    [popoverView adjustBoundsWithMaxWidth:(minWidth - 10) * 2];
    CGRect rect = [relateView.superview convertRect:relateView.frame toView:superView];
    CGPoint point = [relateView.superview convertPoint:relateView.center toView:superView];
    
    popoverView.x = point.x - popoverView.width/2;
    popoverView.y = rect.origin.y + rect.size.height;
    
    return popoverView;
}
@end
