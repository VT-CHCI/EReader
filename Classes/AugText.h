//
//  AugText.h
//  EReader
//
//  Created by Michael Stewart on 4/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AugText : NSObject {
	//BOOL highlighted;
	//CGRect bounds;
	//NSString *text;
	UILabel *label;
	NSString *filename;
}

//@property(nonatomic, assign) BOOL highlighted;
//@property(nonatomic, assign) CGRect bounds;
//@property(nonatomic, retain) NSString *text;
@property(nonatomic, retain) NSString *filename;
@property(nonatomic, retain) UILabel *label;

//+(NSMutableArray*) getArrayForString:(NSString*)words numWords:(NSUInteger)num lengths:(NSMutableArray*)lengths_array firstRect:(CGRect*)boundingRect;
-(BOOL) containsPoint:(CGPoint)point;

@end
