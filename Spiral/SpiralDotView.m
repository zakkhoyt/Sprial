//
//  SpiralDotView.m
//  Spiral
//
//  Created by Zakk Hoyt on 5/15/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "SpiralDotView.h"

@interface SpiralDotView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) CGFloat outputDotSize;
@property (nonatomic) NSTimeInterval startTickCount;
@property (nonatomic, strong) UIView *dotView;
@end

@implementation SpiralDotView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)start{
    // Init
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLink)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.dotColor = [UIColor redColor];
    self.dotSpeedRPS = 1.0;
    self.dotSpeedPixelsPerRevolution = 10.0;
    self.backgroundColor = [UIColor clearColor];
    self.multipleTouchEnabled = YES;
    
    self.startTickCount = [[NSDate date]timeIntervalSince1970];
    self.dotView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.dotView.center = self.center;
    self.dotView.backgroundColor = [UIColor redColor];
    self.dotView.layer.cornerRadius = self.dotView.frame.size.height / 2.0;
    [self addSubview:self.dotView];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tapGesture];
}

-(void)tap:(UITapGestureRecognizer*)sender{
    
    NSLog(@"%lu touches", (unsigned long)sender.numberOfTouches);
}
-(void)stop{
    
}


#pragma mark Private

-(void)displayLink {
    NSTimeInterval currentTickCount = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval elapedTicksInSecs = currentTickCount - self.startTickCount;

    const CGFloat kSpeed = 0.4;
    
    CGFloat anglePerTick = 2*M_PI * kSpeed;
    CGFloat angle = elapedTicksInSecs * anglePerTick;
    
//    CGFloat revolutions = angle / 2*M_PI;
    CGFloat revolutions = elapedTicksInSecs;
    
    // Prune angle down < 2*M_PI
    while(angle >= 2*M_PI){
        angle -= 2*M_PI;
    }

    
    
    
    CGFloat pixelsFromOrigin = revolutions * self.dotSpeedPixelsPerRevolution * kSpeed;
    
    // Prune angle down < 2*M_PI
    while(pixelsFromOrigin >= 200){
        pixelsFromOrigin -= 200;
    }

    
    
    
    CGFloat x = cos(angle);
    CGFloat y = sin(angle);
    x *= pixelsFromOrigin;
    y *= pixelsFromOrigin;
    
    self.dotView.frame = CGRectMake(self.bounds.size.width / 2.0 + x,
                                    self.bounds.size.height / 2.0 + y,
                                    self.dotView.frame.size.width,
                                    self.dotView.frame.size.height);
    
//    
//
//    NSLog(@"%.3f t angle:%.3f revs:%3f pfo:%.3f x:%.0f y:%.f",
//          elapedTicksInSecs,
//          angle,
//          revolutions,
//          pixelsFromOrigin,
//          self.dotView.frame.origin.x,
//          self.dotView.frame.origin.y);
}

//-(void)touches:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSUInteger count = touches.allObjects.count;
//    self.outputDotSize = count;
//    NSLog(@"%lu touches", (unsigned long)count);
//}
//
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self touches:touches withEvent:event];
//}
//
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self touches:touches withEvent:event];
//}
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self touches:touches withEvent:event];
//}




@end
