/*
 Copyright 2009-2014 Urban Airship Inc. All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.

 2. Redistributions in binaryform must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided withthe distribution.

 THIS SOFTWARE IS PROVIDED BY THE URBAN AIRSHIP INC``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL URBAN AIRSHIP INC OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import <XCTest/XCTest.h>
#import "UAApplicationMetriccs+Internal.h"
#import <OCMock/OCMock.h>

@interface UAApplicationMetricsTest : XCTestCase
@property(nonatomic, strong)UAApplicationMetrics *metrics;
@end

@implementation UAApplicationMetricsTest

- (void)setUp {
    [super setUp];

    self.metrics = [[UAApplicationMetrics alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testApplicationActive {
    NSDate *expectedDate = [NSDate date];

    // Make date always return our expected date
    id mockDate = [OCMockObject mockForClass:[NSDate class]];
    [[[mockDate stub] andReturn:expectedDate] date];

    [self.metrics didBecomeActive];

    XCTAssertEqualObjects(expectedDate, self.metrics.lastApplicationOpenDate,
                          @"Application active should set the last open date");
}

@end
