//
//  main.m
//  euler17
//
//  Created by Brian Morton on 2/25/11.
//  Copyright 2011 The San Diego Reader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnglishNumber.h"

int main (int argc, const char * argv[])
{
    // Confirm we have the proper number of arguments
    if (argc < 2) {
        printf("usage: euler17 [number] [-debug]\n\n");
        return 0;
    }

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // Setup the object that makes the conversion magic happen
    EnglishNumber *number = [[EnglishNumber alloc] init];
    
    // Hold a sum of all digits in our loop
    int sum = 0;
    
    // Loop through int from 1 to the number passed in from the cli
    for (int i = 1; i <= [[NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding] intValue]; i++) {
        number.number = i;
        
        // If we throw a random flag at the end of our command, show this full debug output.
        if (argc == 3) {
            NSLog(@"%@", [number string]);
        }
        
        // Sum up our letters
        sum += [number numberOfLetters];
    }

    printf("Sum of all letters: %i\n\n", sum);
    
    // Get rid of the magic object
    [number release];

    [pool drain];
    return 0;
}

