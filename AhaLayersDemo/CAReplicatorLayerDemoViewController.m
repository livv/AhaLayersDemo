//
//  CAReplicatorLayerDemoViewController.m
//  AhaLayersDemo
//
//  Created by wei on 15/12/16.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "CAReplicatorLayerDemoViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface CAReplicatorLayerDemoViewController ()
{
    CAReplicatorLayer * r;
}

@end

@implementation CAReplicatorLayerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleStr;
    
    r = [CAReplicatorLayer new];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    [[r sublayers] makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    
    switch (self.index) {
        case 0:
            [self animation0];
            break;
        case 1:
            [self animation1];
            break;
        case 2:
            [self animation2];
            break;
    }
}


#pragma mark -


- (void)animation0 {
    
    
    r.bounds = CGRectMake(0, 0, 60, 60);
    r.position = self.view.center;
    r.backgroundColor = [UIColor lightGrayColor].CGColor;
    r.masksToBounds = YES;
    
    [self.view.layer addSublayer:r];
    
    
    CALayer * bar = [CALayer new];
    bar.bounds = CGRectMake(0, 0, 8, 40);
    bar.position = CGPointMake(10, 75);
    bar.cornerRadius = 2.0;
    bar.backgroundColor = [UIColor redColor].CGColor;
    [r addSublayer:bar];
    
    
    CABasicAnimation * move = [CABasicAnimation animationWithKeyPath:@"position.y"];
    move.toValue = @(bar.position.y - 35.0f);
    move.duration = 0.5;
    move.autoreverses = YES;
    move.repeatCount = 10;
    [bar addAnimation:move forKey:nil];
    
    r.instanceCount = 3;
    r.instanceTransform = CATransform3DMakeTranslation(20, 0, 0);
    r.instanceDelay = 0.33;
}

- (void)animation1 {
    
//    CAReplicatorLayer * r = [CAReplicatorLayer new];
    r.bounds = CGRectMake(0, 0, 200, 200);
    r.cornerRadius = 10.0f;
    r.position = self.view.center;
    r.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.75].CGColor;
    
    [self.view.layer addSublayer:r];
    
    CALayer * dot = [CALayer new];
    dot.bounds = CGRectMake(0, 0, 14, 14);
    dot.position = CGPointMake(100, 40);
    dot.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    dot.borderColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    dot.borderWidth = 1.0f;
    dot.cornerRadius = 7.0f;
    dot.transform = CATransform3DMakeScale(0.0, 0.0, 0.0);
    [r addSublayer:dot];
    
    
    CGFloat nrDots = 16;
    
    r.instanceCount = nrDots;
    CGFloat angle = (2 * M_PI) / nrDots;
    r.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
    
    
    NSTimeInterval duration = 1.6;
    CAKeyframeAnimation * shrink0 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    shrink0.values = @[@(0.0), @(1.0), @(0.0), @(0.0)];
    shrink0.keyTimes = @[@(0.0), @(0.1), @(0.8), @(1.0)];
    shrink0.duration = duration;
    shrink0.repeatCount = INFINITY;
    [dot addAnimation:shrink0 forKey:nil];
    
    
    r.instanceDelay = duration / nrDots;
}

- (void)animation2 {
    
//    CAReplicatorLayer * r = [CAReplicatorLayer new];
    r.bounds = self.view.bounds;
    r.position = self.view.center;
    r.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.75].CGColor;
    [self.view.layer addSublayer:r];
    
    CALayer * dot = [CALayer new];
    dot.bounds = CGRectMake(0, 0, 10, 10);
    dot.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    dot.borderColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    dot.borderWidth = 1.0f;
    dot.cornerRadius = 5.0f;
    dot.shouldRasterize = YES;
    dot.rasterizationScale = [UIScreen mainScreen].scale;
    [r addSublayer:dot];
    
    
    NSTimeInterval duration = 4.5;
    CAKeyframeAnimation * move = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    move.path = [self path];
    move.repeatCount = INFINITY;
    move.duration = duration;
    move.rotationMode = kCAAnimationRotateAuto;
    [dot addAnimation:move forKey:@"path"];
    
    CGFloat nrDots = 45;
    r.instanceCount = nrDots;
    r.instanceDelay = duration / nrDots;
    r.instanceColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.5 alpha:.3].CGColor;
    r.instanceGreenOffset = -0.05;
    r.instanceBlueOffset = 0.05;
    r.instanceRedOffset = 0.05;
    r.instanceAlphaOffset = 0.05;
}

- (CGPathRef)path {
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath moveToPoint:CGPointMake(31.5, 71.5)];
    [bezierPath addLineToPoint:CGPointMake(31.5, 23.5)];
    [bezierPath addCurveToPoint:CGPointMake(58.5, 38.5)
                  controlPoint1:CGPointMake(31.5, 23.5)
                  controlPoint2:CGPointMake(62.46, 18.69)];
    [bezierPath addCurveToPoint:CGPointMake(53.5, 45.5)
                  controlPoint1:CGPointMake(57.5, 43.5)
                  controlPoint2:CGPointMake(53.5, 45.5)];
    [bezierPath addLineToPoint:CGPointMake(43.5, 48.5)];
    [bezierPath addLineToPoint:CGPointMake(53.5, 66.5)];
    [bezierPath addLineToPoint:CGPointMake(62.5, 51.5)];
    [bezierPath addLineToPoint:CGPointMake(70.5, 66.5)];
    [bezierPath addLineToPoint:CGPointMake(86.5, 23.5)];
    [bezierPath addLineToPoint:CGPointMake(86.5, 78.5)];
    [bezierPath addLineToPoint:CGPointMake(31.5, 78.5)];
    [bezierPath addLineToPoint:CGPointMake(31.5, 71.5)];
    [bezierPath closePath];
    
    
    CGAffineTransform T = CGAffineTransformMakeScale(3.0, 3.0);
    CGAffineTransform T2 = CGAffineTransformMakeTranslation(0, 100);
    return CGPathCreateCopyByTransformingPath(CGPathCreateCopyByTransformingPath(bezierPath.CGPath, &T), &T2);
}


@end
