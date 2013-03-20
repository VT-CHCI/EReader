//
//  EReaderViewController.m
//  EReader
//

#import "EReaderViewController.h"
#import "FliteTTS.h"
#import "AugText.h"
#import "CustomWindow.h"
#import "LoadOperation.h"

@implementation EReaderViewController

//@synthesize imageView;
@synthesize words;
@synthesize initialized;
@synthesize button;
@synthesize fliteEngine;
@synthesize waiting;
@synthesize buttonHasBeenClicked;

//- (void)loadView
//{
//	self.view = [[CustomWindow alloc] init];
//	
//	self.view.backgroundColor = [UIColor whiteColor];
//}
	
	//NSString * demoText = @"Alice was beginning ";//to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, 'and what is the use of a book,' thought Alice 'without pictures or conversation?' So she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit with pink eyes ran close by her. There was nothing so VERY remarkable in that; nor did Alice think it so VERY much out of the way to hear the Rabbit say to itself, 'Oh dear! Oh dear! I shall be late!' (when she thought it over afterwards, it occurred to her that she ought to have wondered at this, but at the time it all seemed quite natural); but when the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at it, and then hurried on, Alice started to her feet, for it flashed across her mind that she had never before seen a rabbit with either a waistcoat-pocket, or a watch to take out of it, and burning with curiosity, she ran across the field after it, and fortunately was just in time to see it pop down a large rabbit-hole under the hedge. ";
//	
//	NSArray *chunks = [demoText componentsSeparatedByString: @" "];
//	self.words = [[NSMutableArray alloc] initWithCapacity:[chunks count]];
////	NSUInteger wordGap = 50;
//	NSUInteger wordGapFactor = 2;
//	NSUInteger lineGap = 20;
//	
//	NSUInteger currentX = 0;
//	NSUInteger currentY = 0;
//	
//	NSUInteger MAX_X = 768;
//	NSUInteger MAX_Y = 1024;
//	NSUInteger FONT_SIZE = 28;
//	
//	BOOL init = YES;
//	
//	for (NSString *str in chunks) {
//		if ([str length] < 1 )
//		{
//			continue;
//		}
//		
//		//create label
//		AugText* label = [[AugText alloc] init];
//		label.userInteractionEnabled = YES;
//		
//		label.text = str;
//		
//		[label setFont:[UIFont fontWithName:@"Arial" size:FONT_SIZE]];
//		
//		//determine frame size
//		NSUInteger wordHeight = (label.font.descender-label.font.ascender);
//		NSUInteger lineHeight = wordHeight + lineGap;
//		NSUInteger letterWidth = label.font.capHeight;
//		NSUInteger wordWidth = [label.text length] * letterWidth;
//		
//		
//		//determine frame position
//		if (init)
//		{
//			init = NO;
//			currentY = lineHeight;
//		}
////		else {
////			
////		}
//		
//		if (currentX + wordWidth > MAX_X)
//		{
//			currentX = 0;
//			currentY += lineHeight;
//		}
//		
//		if (currentY > MAX_Y - lineGap)
//		{
//			break;
//		}
//
//		
//		CGRect labelFrame = CGRectMake(currentX, currentY, wordWidth, lineHeight);
//		label.frame = labelFrame;
//		
//		label.filename = [fliteEngine storeText:label.text];
//		
//		[self.view addSubview:label];
//		
//		[self.words addObject:label];
//		
//		currentX += wordWidth * (1 + wordGapFactor);
//
//	}
	
	
	
//}

-(IBAction)textFieldDoneEditing:(id)sender
{
	[sender resignFirstResponder]; // I think this closes the keyboard?
	[fliteEngine speakText:[sender text]];
	
}
//
//-(void)speak:(NSString*)text
//{
//	[fliteEngine speakText:text];
//}

-(void)speakTextfromFile:(NSString*)filename
{
	[fliteEngine speakTextfromFile:filename];
}

-(NSString*)storeText:(NSString *)text
{
	return [fliteEngine storeText:text];
}


- (void)viewDidLoad 
{
	[super viewDidLoad];
	self.buttonHasBeenClicked = NO;
	self.initialized = NO;
	((CustomWindow*) self.view).controller = self;
	
	self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];// initWithFrame:CGRectMake(100, 100, 200, 100)];
	self.button.frame = CGRectMake(100, 100, 200, 100);
	//UILabel* label = [[UILabel alloc] init];
	//label.text = @"BEGIN";
	[self.button setTitle:@"BEGIN" forState:UIControlStateNormal];
	//button.titleLabel = label;
	[self.button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:self.button];
	queue = [[NSOperationQueue alloc] init];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
//- (void)viewDidLoad 
-(IBAction)buttonClicked//:
{
    //[super viewDidLoad];
	
	if (!self.buttonHasBeenClicked) {
		self.buttonHasBeenClicked = YES;
	
	[self.button removeFromSuperview];
	
	waiting = [[UIActivityIndicatorView alloc] initWithFrame:self.button.frame];
	[waiting startAnimating];
	waiting.hidesWhenStopped = YES;
	waiting.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
	[waiting sizeToFit]; 
	[self.view addSubview:waiting];
	
	LoadOperation *loadOp = [[LoadOperation alloc] initWithController:self];
	[queue addOperation:loadOp];
	//[loadOp release];
	}
}
	

//	fliteEngine = [[FliteTTS alloc] init];
//	
//	NSString * demoText = @"Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, 'and what is the use of a book,' thought Alice 'without pictures or conversation?' So she was considering in her own mind";// (as well as she could, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit with pink eyes ran close by her. There was nothing so VERY remarkable in that; nor did Alice think it so VERY much out of the way to hear the Rabbit say to itself, 'Oh dear! Oh dear! I shall be late!' (when she thought it over afterwards, it occurred to her that she ought to have wondered at this, but at the time it all seemed quite natural); but when the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at it, and then hurried on, Alice started to her feet, for it flashed across her mind that she had never before seen a rabbit with either a waistcoat-pocket, or a watch to take out of it, and burning with curiosity, she ran across the field after it, and fortunately was just in time to see it pop down a large rabbit-hole under the hedge. ";
//	
//	NSArray *chunks = [demoText componentsSeparatedByString: @" "];
//	self.words = [[NSMutableArray alloc] initWithCapacity:[chunks count]];
//	//	NSUInteger wordGap = 50;
//	float wordGapFactor = .8;
//	NSUInteger lineGap = 40;
//	
//	NSUInteger currentX = 0;
//	NSUInteger currentY = 0;
//	
//	NSUInteger MAX_X = 768;
//	NSUInteger MAX_Y = 1024;
//	NSUInteger FONT_SIZE = 28;
//	
//	BOOL init = YES;
//	
//	for (NSString *str in chunks) {
//		if ([str length] < 1 )
//		{
//			continue;
//		}
//		
//		//create label
//		AugText* textLabel = [[AugText alloc] init];
//		UILabel* label = [[UILabel alloc] init];
//		textLabel.label = label;
//		textLabel.label.highlightedTextColor = [UIColor redColor];
//		label.userInteractionEnabled = YES;
//		
//		label.text = str;
//		
//		[label setFont:[UIFont fontWithName:@"Arial" size:FONT_SIZE]];
//		
//		//NSLog(@"Creating: %s",label.text);
//		
//		//determine frame size
//		NSUInteger wordHeight = abs(label.font.descender-label.font.ascender);
//		NSUInteger lineHeight = wordHeight + lineGap;
//		NSUInteger letterWidth = label.font.capHeight;
//		NSUInteger wordWidth = [label.text length] * letterWidth;
//		
//		
//		//determine frame position
//		if (init)
//		{
//			init = NO;
//			currentY = lineHeight;
//		}
//		//		else {
//		//			
//		//		}
//		
//		if (currentX + wordWidth > MAX_X)
//		{
//			currentX = 0;
//			currentY += lineHeight;
//		}
//		
//		if (currentY > MAX_Y - lineGap)
//		{
//			break;
//		}
//		
//		
//		CGRect labelFrame = CGRectMake(currentX, currentY, wordWidth, lineHeight);
//		label.frame = labelFrame;
//		
//		textLabel.filename = [fliteEngine storeText:label.text];
//		[fliteEngine storeText:[NSString stringWithFormat:@"%@highlighted", label.text]];
//		
//		[self.view addSubview:label];
//		
//		[self.words addObject:textLabel];
//		
//		currentX += wordWidth * (1 + wordGapFactor);
//		
//	}
//	
//	
//	//((CustomWindow*) self.view).controller = self;
//	((CustomWindow*)self.view).words = self.words;
	
	
	
	//self.initialized = YES;
//	[waiting stopAnimating]; 
	
	
	
	
	//[fliteEngine setPitch:125.0 variance:11.0 speed:1.1];
	//[fliteEngine speakText:@"It works."];
//}

- (void)wordsLoaded
{
	self.initialized = YES;
	[waiting stopAnimating]; 
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
