//
//  BIDViewController.m
//  Persistence
//
//  Created by Dexter Launchlabs on 7/30/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDViewController.h"
#import "BIDFourLines.h"
//#define kFilename @"data.plist"
#define kFilename @"archive"
#define kDataKey @"Data"
@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize field1;
@synthesize field2;
@synthesize field3;
@synthesize field4;

- (NSString *)dataFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(
                                                         NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:kFilename];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *filePath = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
//        NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath]; field1.text = [array objectAtIndex:0];
//        field2.text = [array objectAtIndex:1];
//        field3.text = [array objectAtIndex:2];
//        field4.text = [array objectAtIndex:3];
        NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[self dataFilePath]];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        BIDFourLines *fourLines = [unarchiver decodeObjectForKey:kDataKey]; [unarchiver finishDecoding];
        field1.text = fourLines.field1; field2.text = fourLines.field2; field3.text = fourLines.field3; field4.text = fourLines.field4;
    }
    UIApplication *app = [UIApplication sharedApplication]; [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
}
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view. // e.g. self.myOutlet = nil;
    self.field1 = nil;
    self.field2 = nil;
    self.field3 = nil;
    self.field4 = nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)applicationWillResignActive:(NSNotification *)notification {
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    [array addObject:field1.text];
//    [array addObject:field2.text];
//    [array addObject:field3.text];
//    [array addObject:field4.text];
//    [array writeToFile:[self dataFilePath] atomically:YES];
    BIDFourLines *fourLines = [[BIDFourLines alloc] init]; fourLines.field1 = field1.text;
    fourLines.field2 = field2.text;
    fourLines.field3 = field3.text;
    fourLines.field4 = field4.text;
    NSMutableData *data = [[NSMutableData alloc] init]; NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]
                                                                                     initForWritingWithMutableData:data];
    [archiver encodeObject:fourLines forKey:kDataKey]; [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];

}
@end
