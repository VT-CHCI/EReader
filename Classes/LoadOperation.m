//
//  LodOperation.m
//  EReader
//
//  Created by Michael Stewart on 4/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LoadOperation.h"
#import "CustomWindow.h"
#import "FliteTTS.h"

@implementation LoadOperation

@synthesize controller;

- (id)initWithController:(EReaderViewController*)ereadercontroller
{
	if (![super init]) return nil;
    self.controller = ereadercontroller;
    return self;
	
}

- (void)main {
	self.controller.fliteEngine = [[FliteTTS alloc] init];
	[self.controller.fliteEngine speakText:@"Loading, please wait."];
	
	NSString * demoText = @"Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, 'and what is the use of a book,' thought Alice 'without pictures or conversation?' So she was considering in her own mind";// (as well as she could, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit with pink eyes ran close by her. There was nothing so VERY remarkable in that; nor did Alice think it so VERY much out of the way to hear the Rabbit say to itself, 'Oh dear! Oh dear! I shall be late!' (when she thought it over afterwards, it occurred to her that she ought to have wondered at this, but at the time it all seemed quite natural); but when the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at it, and then hurried on, Alice started to her feet, for it flashed across her mind that she had never before seen a rabbit with either a waistcoat-pocket, or a watch to take out of it, and burning with curiosity, she ran across the field after it, and fortunately was just in time to see it pop down a large rabbit-hole under the hedge. ";
	
	NSArray *chunks = [demoText componentsSeparatedByString: @" "];
	self.controller.words = [[NSMutableArray alloc] initWithCapacity:[chunks count]];
	//	NSUInteger wordGap = 50;
	float wordGapFactor = .8;
	NSUInteger lineGap = 40;
	
	NSUInteger currentX = 0;
	NSUInteger currentY = 0;
	
	NSUInteger MAX_X = 768;
	NSUInteger MAX_Y = 1024;
	NSUInteger FONT_SIZE = 28;
	
	BOOL init = YES;
	
	for (NSString *str in chunks) {
		if ([str length] < 1 )
		{
			continue;
		}
		
		//create label
		AugText* textLabel = [[AugText alloc] init];
		UILabel* label = [[UILabel alloc] init];
		textLabel.label = label;
		textLabel.label.highlightedTextColor = [UIColor redColor];
		label.userInteractionEnabled = YES;
		
		label.text = str;
		
		[label setFont:[UIFont fontWithName:@"Arial" size:FONT_SIZE]];
		
		//NSLog(@"Creating: %s",label.text);
		
		//determine frame size
		NSUInteger wordHeight = abs(label.font.descender-label.font.ascender);
		NSUInteger lineHeight = wordHeight + lineGap;
		NSUInteger letterWidth = label.font.capHeight;
		NSUInteger wordWidth = [label.text length] * letterWidth;
		
		
		//determine frame position
		if (init)
		{
			init = NO;
			currentY = wordHeight;
		}
		//		else {
		//			
		//		}
		
		if (currentX + wordWidth > MAX_X)
		{
			currentX = 0;
			currentY += lineHeight;
		}
		
		if (currentY > MAX_Y - lineGap)
		{
			break;
		}
		
		
		CGRect labelFrame = CGRectMake(currentX, currentY, wordWidth, lineHeight);
		label.frame = labelFrame;
		
		textLabel.filename = [self.controller.fliteEngine storeText:label.text];
		[self.controller.fliteEngine storeText:[NSString stringWithFormat:@"%@highlighted", label.text]];
		
		[self.controller.view addSubview:label];
		
		[self.controller.words addObject:textLabel];
		
		currentX += wordWidth * (1 + wordGapFactor);
		
	}
	
	
	//((CustomWindow*) self.view).controller = self;
	((CustomWindow*)self.controller.view).words = self.controller.words;
	[self.controller wordsLoaded];

}


@end
