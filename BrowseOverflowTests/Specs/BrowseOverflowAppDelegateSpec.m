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
#import "KWBeIdenticalToMatcher.h"
#import "KWBeKindOfClassMatcher.h"
#import "BrowseOverflowViewController.h"
#import "TopicTableDataSource.h"
#import "KWBeZeroMatcher.h"
#import "BrowseOverflowObjectConfiguration.h"

SPEC_BEGIN(BrowseOverflowAppDelegateSpec)

describe(@"BrowseOverflowAppDelegate", ^{
    context(@"when application is launched", ^{
        BrowseOverflowAppDelegate *appDelegate = [[BrowseOverflowAppDelegate alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] init];
        UIWindow *window = [[UIWindow alloc] init];
        appDelegate.window = window;
        appDelegate.navigationController = navigationController;
        BOOL didFinishLaunchingWithOptionsReturnValue =
                [appDelegate application: nil didFinishLaunchingWithOptions: nil];

        it(@"should have window visible and make key.", ^{
            [[theValue(window.keyWindow) should] beYes];
        });

        it(@"should have root navigation controller.", ^{
            [[window.rootViewController should] beIdenticalTo:navigationController];
        });

        it(@"should return YES.", ^{
            [[theValue(didFinishLaunchingWithOptionsReturnValue) should] beYes];
        });

        it(@"should show a BrowseOverflowViewController.", ^{
            id visibleViewController = appDelegate.navigationController.topViewController;
            [[visibleViewController should] beKindOfClass:[BrowseOverflowViewController class]];
        });

        it(@"should have view controller with topic table data source.", ^{
            UIViewController *topViewController = navigationController.topViewController;
            BrowseOverflowViewController *viewController =
                    (BrowseOverflowViewController *) topViewController;
            [[viewController.dataSource should] beKindOfClass:[TopicTableDataSource class]];
        });

        it(@"should not have empty topic list.", ^{
            UIViewController *topViewController = navigationController.topViewController;
            BrowseOverflowViewController *viewController =
                    (BrowseOverflowViewController *) topViewController;
            id <UITableViewDataSource> dataSource = [viewController dataSource];
            int rows = [dataSource tableView:nil numberOfRowsInSection:0];
            [[theValue(rows) shouldNot] beZero];
        });

        it(@"should have view controller with object configuration.", ^{
            UIViewController *topViewController = navigationController.topViewController;
            BrowseOverflowViewController *viewController =
                    (BrowseOverflowViewController *) topViewController;
            [viewController.objectConfiguration shouldNotBeNil];
        });
    });
});

SPEC_END
