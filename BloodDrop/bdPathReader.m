//
//  bdPathReader.m
//  BloodDrop
//
//  Created by AhmedElnaqah on 1/26/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import "bdPathReader.h"
@interface bdPathReader()
- (id)initOnce;
-(void) addShapesWithFile:(NSString*)plist;
@end
@implementation bdPathReader
@synthesize pointList=_pointList;
static bdPathReader * sharedPathReaderInstance;
+(id)sharedPathReader
{
    if (sharedPathReaderInstance) {
        return sharedPathReaderInstance;
    }
    sharedPathReaderInstance=[[bdPathReader alloc] initOnce];
    return sharedPathReaderInstance;
}
- (id)initOnce
{
    self = [super init];
    if (self) {
        self.pointList=[NSMutableArray array];
        [self addShapesWithFile:@"path.plist"];
    }
    return self;
}

-(void) addShapesWithFile:(NSString*)plist
{
    NSString *path = [[NSBundle mainBundle] pathForResource:plist
                                                     ofType:nil
                                                inDirectory:nil];
    
	NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //NSDictionary *metadataDict = [dictionary objectForKey:@"metadata"];
    
    
    
    
    
    NSDictionary *bodyDict = [dictionary objectForKey:@"bodies"];
    
    
    
    for(NSString *bodyName in bodyDict)
    {
        // get the body data
        NSDictionary *bodyData = [bodyDict objectForKey:bodyName];
        
                
        // iterate through the fixtures
        NSArray *fixtureList = [bodyData objectForKey:@"fixtures"];
        
        for(NSDictionary *fixtureData in fixtureList)
        {
            NSArray * polygons=[fixtureData objectForKey:@"polygons"];
            for (NSArray * polygon in polygons) {
                for (NSString * pointStr in polygon) {
                   // NSMutableString * pMutStr=[NSMutableString stringWithString:pointStr];
//                    [pMutStr replaceOccurrencesOfString:@"}" withString:@"" options:NSCaseInsensitiveSearch  range:NSMakeRange(0, [pMutStr length])];
//                    [pMutStr replaceOccurrencesOfString:@"{" withString:@"" options:NSCaseInsensitiveSearch  range:NSMakeRange(0, [pMutStr length])];
//                    NSArray* comp =[pMutStr componentsSeparatedByString:@","];
//                    NSString * xStr=[comp objectAtIndex:0];
//                    NSString * yStr=[comp objectAtIndex:1];
                    CGSize screenSize=[[UIScreen mainScreen] bounds].size;
                    CGPoint point= CGPointFromString(pointStr);//CGPointMake([xStr floatValue], [yStr floatValue]);
                    
                    UIImage * pathImage=[UIImage imageNamed:@"path.png"];
                    CGSize imageSize=pathImage.size;
                    
                    //NSLog(@"size %@",NSStringFromCGSize(imageSize));
                    CGSize scaleSize=CGSizeMake(screenSize.height/imageSize.width, screenSize.width/imageSize.height);
                    point=CGPointApplyAffineTransform(point, CGAffineTransformMakeScale(scaleSize.width, scaleSize.height));
                    point.y=screenSize.width-point.y;
                    [self.pointList addObject:[NSValue valueWithCGPoint:point]];
                }
            }
        }
        
        // add the body element to the hash
    }
}

@end
