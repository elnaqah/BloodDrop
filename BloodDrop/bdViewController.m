//
//  bdViewController.m
//  BloodDrop
//
//  Created by AhmedElnaqah on 1/26/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import "bdViewController.h"
#import "bdPathReader.h"
#import <QuartzCore/QuartzCore.h>
#import "bd.h"

#define kAccelerometerFrequency        50.0 //Hz
#define startPoint CGPointMake(355,500)
#define jumbScale 5
@interface bdViewController ()
{
    CADisplayLink * displayLink;
    NSArray * pathPoints;
}
@end

@implementation bdViewController
@synthesize ball=_ball;
- (void)viewDidLoad
{
    [self configureAccelerometer];
    [super viewDidLoad];
    _ball=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    _ball.frame=CGRectMake(startPoint.x, startPoint.y, 10, 10);
    [self.view addSubview:_ball];
    displayLink=[CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [displayLink setFrameInterval:500];
    bdPathReader * pathReader=[bdPathReader sharedPathReader];
    pathPoints=pathReader.pointList;
    bd * debug=[[bd alloc] initWithFrame:self.view.bounds andPointList:pathPoints];
    [self.view addSubview:debug];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark update
-(void) update
{
    [UIView animateWithDuration:2 animations:^{
        _ball.transform=CGAffineTransformScale(_ball.transform, jumbScale, jumbScale);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            _ball.transform=CGAffineTransformScale(_ball.transform, 1/_ball.transform.a, 1/_ball.transform.a);
        }];
    }];
    
    NSLog(@"update ");
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
     //NSLog(@"accelerometer %f , %f , %f",x,y,z);

    CGAffineTransform translateTrans=CGAffineTransformTranslate(_ball.transform, 10*y, 10*x);
    CGPoint center= _ball.center;
    center=CGPointApplyAffineTransform(center, translateTrans);
    BOOL intersect=NO;
    //CGRect bound=CGRectMake(center.x-(_ball.bounds.size.width/2), center.y-(_ball.bounds.size.height/2), _ball.bounds.size.width, _ball.bounds.size.height);
    for (NSValue * pointValue in pathPoints) {
        CGPoint point =[pointValue CGPointValue];
        intersect=CGRectContainsPoint(_ball.frame, point);
    }
    if (CGRectContainsPoint(self.view.bounds, center) && !intersect) {
        _ball.transform=translateTrans;//CGAffineTransformTranslate(_ball.transform, 10*y, 10*x);
    }
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
