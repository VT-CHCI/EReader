//
//  EReaderAppDelegate.h
//	EReader
//

#import <UIKit/UIKit.h>

@class EReaderViewController;

@interface EReaderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EReaderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EReaderViewController *viewController;

@end

