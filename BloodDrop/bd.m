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
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    for (NSValue * value in self.pointList) {
        CGPoint point=[value CGPointValue];
        CGContextFillEllipseInRect(context, CGRectMake(point.x-1,point.y-1,2,2));
    }
    // Drawing code
}


@end
