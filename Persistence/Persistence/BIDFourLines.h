//
//  BIDFourLines.h
//  Persistence
//
//  Created by Dexter Launchlabs on 7/30/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIDFourLines : NSObject <NSCoding, NSCopying>

@property (copy, nonatomic) NSString *field1;
@property (copy, nonatomic) NSString *field2;
@property (copy, nonatomic) NSString *field3;
@property (copy, nonatomic) NSString *field4;
@end
