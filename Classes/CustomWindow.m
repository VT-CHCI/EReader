//
//  CustomWindow.m
//  TextViewEvents
//
//  Created by Michael Stewart on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CustomWindow.h"
#import "AugText.h"

@interface CustomWindow(Private)
-(BOOL)isHighlighting:(NSSet *)touches;
-(BOOL)touchesAreNear:(NSSet *)touches;
-(double)distanceBetween:(NSSet *)touches;
-(UITouch*)leftMostTouch:(NSSet *)touches;
-(UITouch*)rightMostTouch:(NSSet *)touches;
-(AugText*)wordAtPoint:(CGPoint)point;
-(BOOL)newWord:(AugText*)text;
-(void)handleTouches:(NSSet*)touches;
@end


@implementation CustomWindow

@synthesize	words;
@synthesize previousWord;
@synthesize controller;

const NSUInteger FIRST = 0;
const NSUInteger SECOND = 1;
const NSUInteger SQUARED = 2;
const double MAX_DIST_FOR_HIGLIGHTING_TOUCHES = 200;

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
	if (action == @selector(paste:)
		|| action == @selector(copy:)
		|| action == @selector(cut:)
		|| action == @selector(select:)
		|| action == @selector(selectAll:))
	{
		return NO;
	}
	
    return [super canPerformAction:action withSender:sender];
}

-(void)sendEvent:(UIEvent *)event 
{
	if ([(EReaderViewController*)controller initialized])
	{
		//loop over touches for this event
		for(UITouch *touch in [event allTouches]) 
		{
			BOOL touchInteresting = (touch.phase == UITouchPhaseBegan || touch.phase == UITouchPhaseMoved);
			//BOOL isSingleTap = (touch.tapCount == 1);
			//BOOL isHittingCustomTextView = 
	//		(touch.view.class == [TGTextView class]);
			
			if(touchInteresting) 
			{
				//TGTextView *tv = (TGTextView*)touch.view;
				//[tv tapOccurred:touch withEvent:event];
				//if (touch.phase == UITouchPhaseBegan)
	//			{
	//				//[tv touchBegan:touch withEvent:event];
	//				[super sendEvent:event];
	////				[super sendEvent:event];
	//				//[[tv delegate] textViewDidEndEditing:tv];
	//			}
	//			else if (touch.phase == UITouchPhaseMoved)
	//			{
	//				//[tv touchMoved:touch withEvent:event];
	//				[super sendEvent:event];
	//			}
				if (touch.phase == UITouchPhaseBegan || touch.phase == UITouchPhaseMoved)
				{
					[self handleTouches:[event allTouches]];
				}
				
				else if (touch.phase == UITouchPhaseEnded)
				{
					//[tv touchEnded:touch withEvent:event];
					
					[super sendEvent:event];
					[super sendEvent:event];
				}
			}
			else
			{
				//[super sendEvent:event];
			}
		}
	}
	
	else
	{
		UITouch* touch = [[event allTouches] anyObject];
		if ([(EReaderViewController*)controller button] != NULL) {
			if (CGRectContainsPoint(((EReaderViewController*)controller).button.frame, [touch locationInView:self]))
			{
				[(EReaderViewController*)controller buttonClicked];
				//[((EReaderViewController*)controller).button removeFromSuperview];
			}
		}
	}
	//[super sendEvent:event];
	
}

-(void)handleTouches:(NSSet*)touches
{
	
	UITouch* touch;
	BOOL highlighting = NO;
	if ([touches count] > 1)
	{
		highlighting = [self isHighlighting:touches];
		touch = [self rightMostTouch:touches];//[self leftMostTouch:touches];
	}
	else
	{
		touch = [touches anyObject];
	}
	CGPoint point = [touch locationInView:self];
	//NSLog(@"-- I AM TOUCHED move (%f, %f) --", point.x, point.y);
	//NSLog(@" size of words: %d", [words count]);
	AugText *t = [self wordAtPoint:point];
	
	if (t != NULL ){
		
		
		if (highlighting && !t.label.highlighted) 
		{
			t.label.highlighted = YES;
			//t.label.text = [t.label.text stringByAppendingString:@"highlighted"];
			//STORE NEW SOUND FOR THIS WORD
			//t.filename = [(EReaderViewController*)controller storeText:t.label.text];
			[(EReaderViewController*)controller speakTextfromFile:[NSString stringWithFormat:@"%@highlighted", t.filename]];
			previousWord = t;
		}
		if ([self newWord:t]) {
			
			previousWord = t;
			[(EReaderViewController*)controller speakTextfromFile:t.filename];
		}
		
		
	}
	
}

-(BOOL)isHighlighting:(NSSet *)touches
{
	
	return [touches count] == 2 && [self touchesAreNear:touches];
}

-(BOOL)touchesAreNear:(NSSet *)touches
{	
	double distance = [self distanceBetween:touches];
	
	return distance <= MAX_DIST_FOR_HIGLIGHTING_TOUCHES;
}

-(double)distanceBetween:(NSSet *)touches					  
{
	UITouch* touchA = [[touches allObjects] objectAtIndex:FIRST];
	UITouch* touchB = [[touches allObjects] objectAtIndex:SECOND];
	
	CGPoint pointA = [touchA locationInView:self];
	CGPoint pointB = [touchB locationInView:self];
	return sqrt(pow(pointA.x-pointB.x, SQUARED)+pow(pointA.y-pointB.y, SQUARED));
}

- (UITouch*)leftMostTouch:(NSSet *)touches
{
	UITouch* touchA = [[touches allObjects] objectAtIndex:FIRST];
	UITouch* touchB = [[touches allObjects] objectAtIndex:SECOND];
	
	CGPoint pointA = [touchA locationInView:self];
	CGPoint pointB = [touchB locationInView:self];
	
	if (pointA.x <= pointB.x) 
	{
		return touchA;
	}
	else 
	{
		return touchB;
	}
}

- (UITouch*)rightMostTouch:(NSSet *)touches
{
	UITouch* touchA = [[touches allObjects] objectAtIndex:FIRST];
	UITouch* touchB = [[touches allObjects] objectAtIndex:SECOND];
	
	CGPoint pointA = [touchA locationInView:self];
	CGPoint pointB = [touchB locationInView:self];
	
	if (pointA.x > pointB.x) 
	{
		return touchA;
	}
	else 
	{
		return touchB;
	}
}


-(AugText*)wordAtPoint:(CGPoint)point
{
	//OPTIMIZE THIS AS WE TALKED ABOUT AFTER CLASS
	for (AugText* word in self.words) {
		if ([word containsPoint:point]) {
			return word;
		}
	}
	return NULL;
}

-(BOOL)newWord:(AugText*)text
{
	return text != previousWord;
}

@end