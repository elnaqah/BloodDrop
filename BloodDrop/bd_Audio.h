//
//  bd_Audio.h
//  BloodDrop
//
//  Created by Mahmoud El-Nouby on 1/26/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
@interface bd_Audio : NSObject
-(void)Audio:(NSString*) Name;
-(void) play;
-(void) stop;
@end
