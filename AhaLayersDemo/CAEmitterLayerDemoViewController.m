//
//  CAEmitterLayerDemoViewController.m
//  AhaLayersDemo
//
//  Created by wei on 15/12/18.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "CAEmitterLayerDemoViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface CAEmitterLayerDemoViewController ()

@end

@implementation CAEmitterLayerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CAEmitterLayer";
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self animation];
}

- (void)animation {
    
    CAEmitterLayer * emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = CGPointMake(CGRectGetMidX(self.view.bounds), self.view.bounds.size.height * .75);
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    emitterLayer.birthRate = 4;
    
    CAEmitterCell * cell = [CAEmitterCell emitterCell];
    cell.contents = (id)[UIImage imageNamed:@"hehe"].CGImage;
    cell.emissionLongitude = -M_PI / 2;
    cell.emissionLatitude = 0;
    cell.lifetime = 1.6;
    cell.birthRate = 50;
    cell.velocity = 400;
    cell.velocityRange = 100;
    cell.yAcceleration = 250;
    cell.emissionRange = M_PI / 4;
    cell.color = CGColorCreateCopy([UIColor colorWithRed:.5 green:.5 blue:.5 alpha:.5].CGColor);
    cell.redRange = 0.5;
    cell.greenRange = 0.5;
    cell.blueRange = 0.5;
    [cell setName:@"rocket"];
    
    emitterLayer.emitterCells = [NSArray arrayWithObject:cell];
    
    [self.view.layer addSublayer:emitterLayer];
}


+ (void)pushWithViewController:(UIViewController *)vc {
    
    NSAssert(vc.navigationController, @".._..");
    
    if (vc.navigationController) {
        
        CAEmitterLayerDemoViewController * _vc = [[CAEmitterLayerDemoViewController alloc] initWithNibName:@"CAEmitterLayerDemoViewController"
                                                                                                    bundle:nil];
        
        [vc.navigationController pushViewController:_vc animated:YES];
    }
}

@end
