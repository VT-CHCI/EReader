//
//  CustomWindow.h
//  TextViewEvents
//
//  Created by Michael Stewart on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AugText.h"
#import "EReaderViewController.h"


@interface CustomWindow : UIWindow {
	NSMutableArray *words;
	AugText* previousWord;
	EReaderViewController* controller;
}

@property(nonatomic, retain) NSMutableArray* words;
@property(nonatomic, retain) AugText* previousWord;
@property(nonatomic, retain) EReaderViewController* controller;

@end
