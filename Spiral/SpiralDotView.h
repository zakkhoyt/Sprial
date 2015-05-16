//
//  SpiralDotView.h
//  Spiral
//
//  Created by Zakk Hoyt on 5/15/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpiralDotView : UIView
@property (nonatomic, strong) UIColor *dotColor;
@property (nonatomic) CGFloat dotSpeedRPS;
@property (nonatomic) CGFloat dotSpeedPixelsPerRevolution;
-(void)start;
-(void)stop;
@end
