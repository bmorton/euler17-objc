//
//  main.m
//  euler17
//
//  Created by Brian Morton on 2/25/11.
//  Copyright 2011 The San Diego Reader. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EnglishNumber : NSObject {
    int number;
    NSString *string;
    NSNumberFormatter *formatter;
}

-(EnglishNumber*)initWithNumber:(int)myNumber;
-(int)number;
-(void)setNumber:(int)myNumber;
-(void)updateString;
-(NSUInteger)numberOfLetters;

@property (retain) NSString *string;

@end

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

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    EnglishNumber *number = [[EnglishNumber alloc] init];
    
    int sum = 0;
    
    if (argc != 2) {
        printf("usage: euler17 [number]\n\n");
        return 0;
    }
    
    for (int i = 1; i <= [[NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding] intValue]; i++) {
        number.number = i;
        //NSLog(@"%@", [number string]);
        sum += [number numberOfLetters];
    }
                                     
    printf("Sum of all letters: %i\n\n", sum);
    
    
    [number release];

    [pool drain];
    return 0;
}

