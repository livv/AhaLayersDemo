//
//  CAGradientLayerDemoViewController.m
//  AhaLayersDemo
//
//  Created by wei on 15/12/18.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "CAGradientLayerDemoViewController.h"


@interface AhaView : UIView

@property (nonatomic, readonly) CALayer *maskLayer;
@property (nonatomic, assign) CGFloat progress;

@end

@implementation AhaView

+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        
        CAGradientLayer *layer = (id)[self layer];
        [layer setStartPoint:CGPointMake(0.0, 0.5)];
        [layer setEndPoint:CGPointMake(1.0, 0.5)];
        
        // Create colors using hues in +5 increments
        NSMutableArray *colors = [NSMutableArray array];
        for (NSInteger hue = 0; hue <= 360; hue += 5) {
            
            UIColor *color;
            color = [UIColor colorWithHue:1.0 * hue / 360.0
                               saturation:1.0
                               brightness:1.0
                                    alpha:1.0];
            [colors addObject:(id)[color CGColor]]; 
        } 
        [layer setColors:[NSArray arrayWithArray:colors]];

        {
            _maskLayer = [CALayer layer];
            [_maskLayer setFrame:CGRectMake(0, 0, 0, frame.size.height)];
            [_maskLayer setBackgroundColor:[[UIColor blackColor] CGColor]];
            [layer setMask:_maskLayer];
        }
        
        [self performAnimation];
    }
    return self;
}

- (void)performAnimation {

    CAGradientLayer *layer = (id)[self layer];
    NSMutableArray *mutable = [[layer colors] mutableCopy];
    id lastColor = [mutable lastObject];
    [mutable removeLastObject];
    [mutable insertObject:lastColor atIndex:0];

    NSArray *shiftedColors = [NSArray arrayWithArray:mutable];

    
    [layer setColors:shiftedColors];
    
    CABasicAnimation *animation;
    animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    [animation setToValue:shiftedColors];
    [animation setDuration:0.08];
    [animation setRemovedOnCompletion:YES];
    [animation setFillMode:kCAFillModeForwards];
    [animation setDelegate:self];
    [layer addAnimation:animation forKey:@"animateGradient"];
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag {
    [self performAnimation];
}


- (void)setProgress:(CGFloat)value {

    if (_progress != value) {
        _progress = MIN(1.0, fabs(value));
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {

    CGRect maskRect = [_maskLayer frame];
    maskRect.size.width = CGRectGetWidth([self bounds]) * _progress;
    [_maskLayer setFrame:maskRect];
}

@end



@interface CAGradientLayerDemoViewController ()

@property (nonatomic, strong) AhaView * ahaView;
@property (nonatomic, weak) IBOutlet UISlider * slider;

@end

@implementation CAGradientLayerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.titleStr;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.slider.hidden = YES;
    
    switch (self.index) {
        case 0:
            [self animation];
            break;
            
        default:
            break;
    }
}

- (void)animation {
    
    self.slider.hidden = NO;
    
    self.ahaView = [[AhaView alloc] initWithFrame:CGRectMake(0, 111, CGRectGetWidth(self.view.bounds), 20)];
    [self.ahaView setProgress:0.7];
    [self.view addSubview:self.ahaView];
}

- (IBAction)actionSlider:(UISlider *)sender {
    
    [self.ahaView setProgress:sender.value];
}



@end
