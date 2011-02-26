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

