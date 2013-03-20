//
//  AugUIImageView.h
//  EReader
//
//  Created by Michael Stewart on 4/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AugText.h"

@interface AugUIImageView : UIImageView {
	NSMutableArray *words;
	UIViewController *controller;
	AugText* previousWord;
	BOOL initialized;
}

@property(nonatomic, retain) NSMutableArray *words;
@property(nonatomic, retain) IBOutlet UIViewController *controller;

-(void)setToDefault;
-(BOOL)newWord:(AugText*)text;
-(AugText*)textAtPos:(CGPoint)point;

@end
