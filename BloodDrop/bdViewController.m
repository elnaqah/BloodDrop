//
//  bdViewController.m
//  BloodDrop
//
//  Created by AhmedElnaqah on 1/26/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import "bdViewController.h"
#define kAccelerometerFrequency        50.0 //Hz
@interface bdViewController ()

@end

@implementation bdViewController
@synthesize ball=_ball;
- (void)viewDidLoad
{
    [self configureAccelerometer];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionBegan");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionEnded");
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionCancelled");
}


-(void)configureAccelerometer
{
    NSLog(@"configureAccelerometer");
    UIAccelerometer*  theAccelerometer = [UIAccelerometer sharedAccelerometer];
    theAccelerometer.updateInterval = 1 / kAccelerometerFrequency;
    
    theAccelerometer.delegate = self;
    // Delegate events begin immediately.
}
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
   
    UIAccelerationValue x, y, z;
    x = acceleration.x;
    y = acceleration.y;
    z = acceleration.z;
     NSLog(@"accelerometer %f , %f , %f",x,y,z);
//    CGAffineTransform translateTrans=CGAffineTransformTranslate(_ball.transform, 10*x, 10*y);
//    CGRect ballFrame= _ball.frame;
//    ballFrame=CGRectApplyAffineTransform(ballFrame, translateTrans);
   // if (CGRectContainsRect(self.view.frame, ballFrame)) {
       // _ball.transform=CGAffineTransformTranslate(_ball.transform, 100*x, 100*y);
    _ball.center=CGPointMake(_ball.center.x+10*x, _ball.center.y+10*y);
   // }
    
    // Do something with the values.
}


- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

@end
