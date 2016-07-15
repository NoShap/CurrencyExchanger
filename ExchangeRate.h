//
//  ExchangeRate.h
//  CurrencyExchanger
//
//  Created by Noah Shapiro on 7/13/16.
//  Copyright © 2016 Noah Shapiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currency.h"
@interface ExchangeRate : NSObject <NSCoding>

//First need to make the Currency class

//Need an initializer!!

@property (strong, nonatomic) Currency* home;

@property (strong, nonatomic) Currency* foreign;

@property (strong, nonatomic) NSNumber* theRate;

//need to assign if not using a pointer* such as when making a float
//still must synthesize

@property (strong, nonatomic) NSDate* expiresOn;

-(bool) updateRate;

-(NSString*) exchangeToHome: (float) value;

-(NSString*) exchangeToForeign: (float) value;

-(void) reverse;

-(NSString*) name;
//gives concatenation of two currency for debugging reasons

-(NSURL*) exchangeRateURL;

-(ExchangeRate*) initWithHome:(Currency*)aHome foreign:(Currency*)aForeign;

-(void) fetch;

@property (strong) NSMutableDictionary *completionHandlerDictionary;

@property (strong) NSURLSessionConfiguration *ephemeralConfigObject;


@end
