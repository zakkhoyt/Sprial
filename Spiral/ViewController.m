//
//  ViewController.m
//  Spiral
//
//  Created by Zakk Hoyt on 5/15/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//
// http://www.reddit.com/tb/364anw

#import "ViewController.h"
#import "SpiralDotView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet SpiralDotView *sprialDotView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.sprialDotView = [[SpiralDotView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.sprialDotView];
    

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.sprialDotView start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
