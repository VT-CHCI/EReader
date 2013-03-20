//
//  AugText.m
//  EReader
//
//  Created by Michael Stewart on 4/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AugText.h"


@implementation AugText
@synthesize	filename;
@synthesize label;

//-(BOOL)isHighlighted 
//{
//	return [self highlighted];
//}
//+(NSMutableArray*) getArrayForString:(NSString*)words numWords:(NSUInteger)num lengths:(NSMutableArray*)lengths_array firstRect:(CGRect*)boundingRect
//{
//	NSMutableArray* returnVal = [NSMutableArray arrayWithCapacity:num];
////	NSArray *chunks = [words componentsSeparatedByString: @" "];
////	int offset = 0;
////	for (int i = 0; i < num; i++) {
////		
////		AugText* word = [[AugText alloc] initWithString:(NSString*)[chunks objectAtIndex:i]];
////		word.highlighted = NO;
////		word.bounds = CGRectMake(boundingRect->origin.x+offset, boundingRect->origin.y, (int)[lengths_array objectAtIndex:i], boundingRect->size.height);
////		[returnVal addObject:word];
////		offset += (int)[lengths_array objectAtIndex:i];
////	}
////	
//	return returnVal;
//}

-(BOOL) containsPoint:(CGPoint)point
{
	return CGRectContainsPoint([self.label frame], point);
}

@end
