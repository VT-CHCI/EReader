//
//  EReaderViewController.h
//  EReader
//

#import <UIKit/UIKit.h>
#import "AugUIImageView.h"

@class FliteTTS;

@interface EReaderViewController : UIViewController {
	IBOutlet UITextField *textField;
	FliteTTS *fliteEngine;
//	AugUIImageView *imageView;
	NSMutableArray *words;
	BOOL initialized;
	UIButton* button;
	NSOperationQueue *queue;
	UIActivityIndicatorView* waiting;
	BOOL buttonHasBeenClicked;
}

@property(nonatomic, retain) NSMutableArray *words;
@property(nonatomic, retain) FliteTTS *fliteEngine;
@property(nonatomic) BOOL initialized;
@property(nonatomic) BOOL buttonHasBeenClicked;
@property(nonatomic, retain) UIButton *button;
@property(nonatomic, retain) UIActivityIndicatorView* waiting;

-(IBAction)buttonClicked;//:(id)sender;
-(IBAction)textFieldDoneEditing:(id)sender;
//-(void)speak:(NSString*)text;
-(NSString*)storeText:(NSString *)text;
-(void)speakTextfromFile:(NSString*)filename;

//+ (id)shared;
- (void)wordsLoaded;


@end

