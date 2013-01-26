//
//  bd.m
//  BloodDrop
//
//  Created by AhmedElnaqah on 1/26/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import "bd.h"
@interface bd()
@property (retain) NSArray * pointList;
@end
@implementation bd
@synthesize pointList;
- (id)initWithFrame:(CGRect)frame andPointList:(NSArray *) list
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor clearColor];
        self.pointList=list;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    for (NSValue * value in self.pointList) {
        CGRect rect=[value CGRectValue];
        CGContextFillRect(context, rect);
    }
    // Drawing code
}


@end
