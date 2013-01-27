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
#import "bd_Audio.h"

#define kAccelerometerFrequency        50.0 //Hz
#define startPoint CGPointMake(380,510)
#define margin CGPointMake(39 ,13)
#define jumbScale 4
@interface bdViewController ()
{
    CADisplayLink * displayLink;
    NSMutableArray * pathPoints;
    bd_Audio *audio;
}
@end

@implementation bdViewController
@synthesize ball=_ball;
@synthesize heart=_heart;
- (void)viewDidLoad
{
    audio=[[bd_Audio alloc] init];
    [audio Audio:@"%@/heart.wav"];
    [self configureAccelerometer];
    [super viewDidLoad];
    _ball=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball_small.png"]];
    _ball.frame=CGRectMake(startPoint.x, startPoint.y, 10, 10);
    
    UIImageView * back=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Pause Background.png"]];
    back.frame=self.view.bounds;
    [self.view addSubview:back];
    

    
    self.heart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Finalheart.png"]];
    self.heart.frame=self.view.bounds;
    [self.view addSubview:self.heart];
    UIImageView * path=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"path.png"]];
    path.frame=self.view.bounds;
    [self.view addSubview:path];
    [self.view bringSubviewToFront:self.btn];
    displayLink=[CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [displayLink setFrameInterval:500];

    pathPoints=[NSMutableArray array];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((815/2)-margin.x, (981/2)+margin.y, 50/2, 57/2)]];
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((836/2)-margin.x, (924/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((860/2)-margin.x, (882/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((869/2)-margin.x, (828/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((875/2)-margin.x, (765/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((884/2)-margin.x, (705/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((899/2)-margin.x, (657/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((917/2)-margin.x, (603/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((932/2)-margin.x, (570/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((977/2)-margin.x, (579/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1019/2)-margin.x, (591/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1064/2)-margin.x, (600/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1100/2)-margin.x, (615/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1136/2)-margin.x, (636/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1145/2)-margin.x, (690/2)+margin.y, 50/2, 57/2)]];
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1139/2)-margin.x, (738/2)+margin.y, 50/2, 57/2)]];
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1136/2)-margin.x, (786/2)+margin.y, 50/2, 57/2)]];
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1133/2)-margin.x, (837/2)+margin.y, 50/2, 57/2)]];
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1148/2)-margin.x, (888/2)+margin.y, 50/2, 57/2)]];
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1166/2)-margin.x, (936/2)+margin.y, 50/2, 57/2)]];
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1190/2)-margin.x, (975/2)+margin.y, 50/2, 57/2)]];
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1223/2)-margin.x, (1008/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1244/2)-margin.x, (1056/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1271/2)-margin.x, (1104/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1295/2)-margin.x, (1146/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1310/2)-margin.x, (1185/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1349/2)-margin.x, (1215/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1391/2)-margin.x, (1206/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1418/2)-margin.x, (1179/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1436/2)-margin.x, (1140/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1439/2)-margin.x, (1083/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1436/2)-margin.x, (1032/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1439/2)-margin.x, (984/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1436/2)-margin.x, (930/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1430/2)-margin.x, (888/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1418/2)-margin.x, (840/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1400/2)-margin.x, (801/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1376/2)-margin.x, (768/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1337/2)-margin.x, (774/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1319/2)-margin.x, (807/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1307/2)-margin.x, (846/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1268/2)-margin.x, (843/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1244/2)-margin.x, (843/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1244/2)-margin.x, (765/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1238/2)-margin.x, (729/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1244/2)-margin.x, (693/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1259/2)-margin.x, (654/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1277/2)-margin.x, (600/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((872/2)-margin.x, (792/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((875/2)-margin.x, (741/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1442/2)-margin.x, (1110/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((839/2)-margin.x, (908/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((858/2)-margin.x, (867/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((882/2)-margin.x, (673/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((897/2)-margin.x, (608/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((904/2)-margin.x, (576/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((822/2)-margin.x, (942/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1129/2)-margin.x, (873/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1142/2)-margin.x, (902/2)+margin.y, 50/2, 57/2)]];
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1254/2)-margin.x, (1082/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1229/2)-margin.x, (1033/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1281/2)-margin.x, (1123/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1233/2)-margin.x, (830/2)+margin.y, 50/2, 57/2)]];
    
    [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1242/2)-margin.x, (820/2)+margin.y, 50/2, 57/2)]];
    
     [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((1277/2)-margin.x, (600/2)+margin.y, 50/2, 57/2)]];
        //bdPathReader * pathReader=[bdPathReader sharedPathReader];
        pathPoints=pathPoints;
       //bd * debug=[[bd alloc] initWithFrame:self.view.bounds andPointList:pathPoints];
      // [self.view addSubview:debug];
    [self.view addSubview:_ball];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
-(void) pathCollide:(NSArray*) list
{
    for (NSValue * value in list) {
        CGPoint point=[value CGPointValue];
        [pathPoints addObject:[NSValue valueWithCGRect:CGRectMake((point.x/2)-margin.x, (point.y/2)+margin.y, 50/2, 57/2)]];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark update
-(void) update
{
    [audio play];
    [UIView animateWithDuration:1 animations:^{
        _ball.transform=CGAffineTransformScale(_ball.transform, jumbScale, jumbScale);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            _ball.transform=CGAffineTransformScale(_ball.transform, 1/_ball.transform.a, 1/_ball.transform.a);
        } completion:^(BOOL finished) {
            [audio stop];
        }];
    }];
    
   [UIView animateWithDuration:1 animations:^{
        self.heart.transform=CGAffineTransformMakeScale( 0.9, 0.9);
    }   completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            self.heart.transform=CGAffineTransformIdentity;
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
    //CGRect rect =[[pathPoints objectAtIndex:0] CGRectValue];
        CGRect rect =[pointValue CGRectValue];
        intersect|=CGRectContainsPoint(rect, center);
        //NSLog(@"%@",NSStringFromCGPoint(point));
    }
    
    //last
    CGRect rectf=[[pathPoints objectAtIndex:[pathPoints count]-1] CGRectValue];
    if(CGRectContainsPoint(rectf, center))
    {
        
    }
    if (CGRectContainsPoint(self.view.bounds, center) && intersect) {
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


-(IBAction)mainMenu:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
