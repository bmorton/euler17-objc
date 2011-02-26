//
//  EnglishNumber.m
//  euler17
//
//  Created by Brian Morton on 2/25/11.
//  Copyright 2011 The San Diego Reader. All rights reserved.
//

#import "EnglishNumber.h"


@implementation EnglishNumber

@synthesize string;

-(EnglishNumber*)init {
    return [self initWithNumber:0];
}

-(EnglishNumber*)initWithNumber:(int)myNumber {
    self = [super init];
    
    if (self) {
        formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle: NSNumberFormatterSpellOutStyle];
        [self setNumber:myNumber];
    }
    
    return self;
}

-(int)number {
    return number;
}

-(void)setNumber:(int)myNumber {
    number = myNumber;
    [self updateString];
}

-(void)updateString {
    self.string = [formatter stringFromNumber:[NSNumber numberWithInt:number]];
}

-(NSUInteger)numberOfLetters {
    NSMutableString *tempString = [[NSMutableString alloc] initWithString:string];
    NSUInteger spaces = [tempString replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [tempString length])];
    NSUInteger dashes = [tempString replaceOccurrencesOfString:@"-" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [tempString length])];
    [tempString release];
    return ([string length] - spaces - dashes);
}

-(void)dealloc {
    [formatter release];
    [super dealloc];
}

@end
