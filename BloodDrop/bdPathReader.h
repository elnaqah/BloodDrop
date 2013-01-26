//
//  bdPathReader.h
//  BloodDrop
//
//  Created by AhmedElnaqah on 1/26/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface bdPathReader : NSObject
+(id)sharedPathReader;
@property (retain) NSMutableArray * pointList;
@end
