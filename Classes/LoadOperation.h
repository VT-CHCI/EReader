//
//  LodOperation.h
//  EReader
//
//  Created by Michael Stewart on 4/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EReaderViewController.h"

@interface LoadOperation : NSOperation {
	EReaderViewController* controller;
}

@property(nonatomic, retain) EReaderViewController* controller;

- (id)initWithController:(EReaderViewController*)ereadercontroller;


@end
