//
//  Currency.h
//  CurrencyExchanger
//
//  Created by Noah Shapiro on 7/13/16.
//  Copyright © 2016 Noah Shapiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject <NSCoding>

@property (strong, nonatomic) NSString* name;

@property (strong, nonatomic) NSString* alphaCode;

@property (strong, nonatomic) NSString* symbol;

@property (strong,nonatomic) NSNumberFormatter* formatter;

-(Currency*) initWithName: (NSString*)aName
                alphaCode: (NSString*)aCode
                   symbol: (NSString*)aSymbol
            decimalPlaces: (NSUInteger)places;

-(NSString*) format:(NSNumber*) quantity;

+(NSArray*) allCurrencies;


@end
