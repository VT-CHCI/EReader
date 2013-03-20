//
//  AugUIImageView.m
//  EReader
//
//  Created by Michael Stewart on 4/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AugUIImageView.h"
#import "AugText.h"
#import "EReaderViewController.h"


//@interface AugUIImageView (Private)
//-(double) distanceBetween:(NSSet *)touches;
//@end

@implementation AugUIImageView
@synthesize words;
@synthesize controller;

//const NSUInteger FIRST = 0;
//const NSUInteger SECOND = 1;
//const NSUInteger SQUARED = 2;
//const double MAX_DIST_FOR_HIGLIGHTING_TOUCHES = 25;


//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//	//[self setToDefault];
//	
//	if ([self isHighlighting:touches])
//	{
//		[(EReaderViewController*)controller speak:@"TWO FINGERS!"];
//		NSLog(@"Distance between touches: %f", [self distanceBetween:touches]);
//	}
//
//	for(UITouch* touch in [touches allObjects])
//	{
////		NSLog(@"self:%p touch.view:%p", self, touch.view);
//		CGPoint point = [touch locationInView:self];
//		NSLog(@"-- I AM TOUCHED began (%f, %f) --", point.x, point.y);
//	}
//}

//-(BOOL)isHighlighting:(NSSet *)touches
//{
//
//	return [touches count] == 2 && [self touchesAreNear:touches];
//}
//
//-(BOOL)touchesAreNear:(NSSet *)touches
//{	
//	double distance = [self distanceBetween:touches];
//	
//	return distance <= MAX_DIST_FOR_HIGLIGHTING_TOUCHES;
//}
//			   
//-(double)distanceBetween:(NSSet *)touches					  
//{
//	UITouch* touchA = [[touches allObjects] objectAtIndex:FIRST];
//	UITouch* touchB = [[touches allObjects] objectAtIndex:SECOND];
//	
//	CGPoint pointA = [touchA locationInView:self];
//	CGPoint pointB = [touchB locationInView:self];
//	return sqrt(pow(pointA.x-pointB.x, SQUARED)+pow(pointA.y-pointB.y, SQUARED));
//}
//
//- (UITouch*)leftMostTouch:(NSSet *)touches
//{
//	UITouch* touchA = [[touches allObjects] objectAtIndex:FIRST];
//	UITouch* touchB = [[touches allObjects] objectAtIndex:SECOND];
//	
//	CGPoint pointA = [touchA locationInView:self];
//	CGPoint pointB = [touchB locationInView:self];
//	
//	if (pointA.x <= pointB.x) 
//	{
//		return touchA;
//	}
//	else 
//	{
//		return touchB;
//	}
//
//	
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//	
//	UITouch* touch;
//	BOOL highlighting = [self isHighlighting:touches];
//	if (highlighting)
//	{
//		touch = [self leftMostTouch:touches];
//	}
//	else
//	{
//		touch = [touches anyObject];
//	}
//	CGPoint point = [touch locationInView:self];
//	NSLog(@"-- I AM TOUCHED move (%f, %f) --", point.x, point.y);
//	//NSLog(@" size of words: %d", [words count]);
//	AugText *t = [self textAtPos:point];
//	
//	if (t != NULL && [self newWord:t]) {
//		
//		previousWord = t;
//		
//		if (highlighting && !t.highlighted) 
//		{
//			t.highlighted = YES;
//			t.text = [t.text stringByAppendingString:@"highlighted"];
//		}
//		//[(EReaderViewController*)controller speak:t.text];
//		NSLog(@"file to speak: %s", t.filename);
//		[(EReaderViewController*)controller speakTextfromFile:t.filename];
//		
//	}
//	
//}
//
//-(AugText*)textAtPos:(CGPoint)point
//{
//	for (AugText *t in words) {
//		if ([t containsPoint:point])
//		{
//			return t;
//		}
//	}
//	return NULL;
//}
//
//-(BOOL)newWord:(AugText*)text
//{
//	return text != previousWord;
//}
//
//-(void)saveWordWav:(AugText*)word
//{
//	NSString *str = [[NSString alloc ] initWithFormat:@"%d%d%d%d", word.bounds.origin.x, word.bounds.origin.y, word.bounds.size.width, word.bounds.size.height];
//	NSLog(@"str: %s", str);
//	word.filename = [(EReaderViewController*)controller storeText:word.text inFile:[word.text stringByAppendingString:str]];
//	NSLog(word.filename);
//}
//
//-(void)addWord:(NSString*)string x:(UInt32)x y:(UInt32)y width:(UInt32)w height:(UInt32)h
//{
//	AugText* word = [[AugText alloc]init];
//	NSString *str = [[NSString alloc] initWithString:string];
//	word.text = str;
//	word.highlighted = NO;
//	word.bounds = CGRectMake(x, y, w, h);
//	[self saveWordWav:word];
//	[words addObject:word];
//}
//
//
//
//-(void)setToDefault
//{
//	words = [[NSMutableArray alloc] initWithCapacity:16];
//	
//	[self addWord:@"Hello" x:16 y:14 width:42 height:31];
//	[self addWord:@"there," x:58 y:14 width:43 height:31];
//	[self addWord:@"how" x:101 y:14 width:34 height:31];
//	[self addWord:@"are" x:135 y:14 width:27 height:31];
//	[self addWord:@"you" x:162 y:14 width:31 height:31];
//	[self addWord:@"doing" x:193 y:14 width:44 height:31];
//	[self addWord:@"today?" x:237 y:14 width:51 height:31];
//	[self addWord:@"I'm" x:16 y:45 width:24 height:31];
//	[self addWord:@"fine" x:40 y:45 width:30 height:31];
//	[self addWord:@"thanks," x:70 y:45 width:55 height:31];
//	[self addWord:@"happy" x:125 y:45 width:48 height:31];
//	[self addWord:@"to" x:173 y:45 width:17 height:31];
//	[self addWord:@"be" x:190 y:45 width:22 height:31];
//	[self addWord:@"speaking" x:212 y:45 width:70 height:31];
//	[self addWord:@"these" x:16 y:76 width:43 height:31];
//	[self addWord:@"words." x:59 y:76 width:56 height:31];
//	
//}

@end
