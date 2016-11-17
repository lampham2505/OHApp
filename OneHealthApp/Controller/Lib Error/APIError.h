//
//  APIError.h
//  Cinema
//
//  Created by Vu Mai Hoang Hai Hung on 8/30/16.
//  Copyright © 2016 Vu Mai Hoang Hai Hung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIError : NSError


/**
 * The HTTP response code from the API request
 */
@property NSInteger errorCode;

/**
 * The error message for the API calls
 */
@property NSString* errorMessage;

/**
 * The error data for the API calls
 */
@property NSData* errorData;

- (APIError*) initWithReason: (NSString*) reason
                     andCode: (NSInteger) code;

@end


