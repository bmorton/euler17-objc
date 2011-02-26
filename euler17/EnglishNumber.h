//
//  EnglishNumber.h
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
