#import "KiwiMacros.h"
#import "KWValue.h"
#import "KWCallSite.h"
#import "KWExpectationType.h"
#import "NSObject+KiwiVerifierAdditions.h"
#import "KWEqualMatcher.h"
#import "KWExample.h"
#import "KWSpec.h"

SPEC_BEGIN(MathSpec)

describe(@"Math", ^{
    it(@"is pretty cool", ^{
        NSUInteger a = 16;
        NSUInteger b = 26;
        [[theValue(a + b) should] equal:theValue(42)];
    });
});

SPEC_END