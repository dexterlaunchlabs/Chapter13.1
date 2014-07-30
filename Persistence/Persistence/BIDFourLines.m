//
//  BIDFourLines.m
//  Persistence
//
//  Created by Dexter Launchlabs on 7/30/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDFourLines.h"
#define kField1Key @"Field1"
#define kField2Key @"Field2"
#define kField3Key @"Field3"
#define kField4Key @"Field4"
@implementation BIDFourLines
@synthesize field1;
@synthesize field2;
@synthesize field3;
@synthesize field4;

#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:field1 forKey:kField1Key];
    [encoder encodeObject:field2 forKey:kField2Key]; [encoder encodeObject:field3 forKey:kField3Key]; [encoder encodeObject:field4 forKey:kField4Key];
    }
  - (id)initWithCoder:(NSCoder *)decoder { if (self = [super init]) {
      field1 = [decoder decodeObjectForKey:kField1Key];
      field2 = [decoder decodeObjectForKey:kField2Key];
      field3 = [decoder decodeObjectForKey:kField3Key];
      field4 = [decoder decodeObjectForKey:kField4Key];
  }
      return self;
      }
#pragma mark -
#pragma mark NSCopying
- (id)copyWithZone:(NSZone *)zone {
    BIDFourLines *copy = [[[self class] allocWithZone:zone] init]; copy.field1 = [self.field1 copyWithZone:zone];
    copy.field2 = [self.field2 copyWithZone:zone];
    copy.field3 = [self.field3 copyWithZone:zone];
    copy.field4 = [self.field4 copyWithZone:zone];
    return copy; }
@end
