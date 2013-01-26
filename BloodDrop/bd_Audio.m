//
//  bd_Audio.m
//  BloodDrop
//
//  Created by Mahmoud El-Nouby on 1/26/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import "bd_Audio.h"

AVAudioPlayer *audioPlayer;

@implementation bd_Audio
-(void)Audio:(NSString*) Name
{
  
NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:Name, [[NSBundle mainBundle] resourcePath]]];

NSError *error;
audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
audioPlayer.numberOfLoops = -1;
    //    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/2.mp3", [[NSBundle mainBundle] resourcePath]]];
    //
    //	NSError *error;
    //	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    //	audioPlayer.numberOfLoops = -1;
    //
    //	if (audioPlayer == nil)
    //		NSLog([error description]);
    //	else
    //		[audioPlayer play];
if (audioPlayer == nil)
{     NSLog(@"Nil here");
//NSLog([error description]);
}
else{
   // [audioPlayer play];
    NSLog(@"playing");
}
    
}


-(void) play
{
    [audioPlayer play];
}
-(void) stop
{
    [audioPlayer stop];
}
    @end
