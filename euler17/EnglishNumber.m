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
    
    // When the number updates, we want to force the string to update too
    [self updateString];
}

-(void)updateString {
    // Set the string to the number's word representation
    self.string = [formatter stringFromNumber:[NSNumber numberWithInt:number]];
}

-(NSUInteger)numberOfLetters {
    // We are going to replace all instances of spaces and dashes to find out how many are contained in
    // our string.  We'll then take the string length and subtract the spaces and dashes.
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
