//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "Pizza.h"

// String to PizzaSize
PizzaSize stringToPizzaSize(NSString *sizeString) {
    if ([sizeString.lowercaseString isEqualToString:@"small"]) {
        return PizzaSizeSmall;
    } else if ([sizeString.lowercaseString isEqualToString:@"medium"]) {
        return PizzaSizeMedium;
    } else {
        // default size
        return PizzaSizeLarge;
    }
}

// PizzaSize to String
NSString * sizeToString(PizzaSize size) {
    switch (size) {
        case PizzaSizeSmall:
            return @"small";
        case PizzaSizeMedium:
            return @"medium";
        case PizzaSizeLarge:
            return @"large";
    }
}


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        while (YES) {
            
            char str[100];
            
            fgets(str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];

            //NSDictionary *sizeDictionary = @{@"small": @0, @"medium": @1, @"large": @2};
            //NSNumber *sizeNumber = [sizeDictionary objectForKey:commandWords[0]];
            //PizzaSize size = (PizzaSize)sizeNumber;

            PizzaSize size = stringToPizzaSize(commandWords[0]);
            
            NSArray *toppings = [commandWords subarrayWithRange:NSMakeRange(1, commandWords.count-1)];
            
            // And then send some message to the kitchen...
            Pizza *pizza = [restaurantKitchen makePizzaWithSize:size toppings: toppings];
            
            NSLog(@"Pizza size: %@", sizeToString(pizza.size));
            
            NSMutableString *toppingsString = [[NSMutableString alloc] initWithString:@"Pizza toppings:"];
            
            for (int i = 0; i < pizza.toppings.count; i++) {
                NSString *topping = [NSString stringWithFormat:@" %@", pizza.toppings[i]];
                [toppingsString appendString:topping];
            }
            NSLog(@"%@", toppingsString);
        }
    }
    return 0;
}

