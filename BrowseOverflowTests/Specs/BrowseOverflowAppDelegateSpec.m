#import "KiwiMacros.h"
#import "KWValue.h"
#import "KWCallSite.h"
#import "KWExpectationType.h"
#import "NSObject+KiwiVerifierAdditions.h"
#import "KWEqualMatcher.h"
#import "KWExample.h"
#import "KWSpec.h"
#import "BrowseOverflowAppDelegate.h"
#import "KWBeTrueMatcher.h"

SPEC_BEGIN(BrowseOverflowAppDelegateSpec)

describe(@"BrowseOverflowAppDelegate", ^{
    context(@"when application is launched", ^{
        it(@"should have window visible and make key.", ^{
            BrowseOverflowAppDelegate *appDelegate = [[BrowseOverflowAppDelegate alloc] init];
            UIWindow *window = [[UIWindow alloc] init];
            appDelegate.window = window;
            [appDelegate application: nil didFinishLaunchingWithOptions: nil];
            [[theValue(window.keyWindow) should] beYes];
        });
    });
});

SPEC_END