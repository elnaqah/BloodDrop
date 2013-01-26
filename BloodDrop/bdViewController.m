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
    _ball=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    _ball.frame=CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 50, 50);
    [self.view addSubview:_ball];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
   // _ball.transform=CGAffineTransformMakeScale(10, 10);
    _ball.transform=CGAffineTransformTranslate(_ball.transform, 10*y, 10*x);
    NSLog(@"transform %@",NSStringFromCGAffineTransform(_ball.transform));
   // _ball.center=CGPointMake(_ball.center.x+10*x, _ball.center.y+10*y);
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
