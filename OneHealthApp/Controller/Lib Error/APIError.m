//
//  APIError.m
//  Cinema
//
//  Created by Vu Mai Hoang Hai Hung on 8/30/16.
//  Copyright © 2016 Vu Mai Hoang Hai Hung. All rights reserved.
//

#import "APIError.h"

@implementation APIError


/*
 * Initialization
 * @param	reason	The reason for the error
 * @param	code	The HTTP response code from the API request
 * @param	data	The Raw HTTP response data from the API request
*/
- (APIError*) initWithReason: (NSString*) reason
                     andCode: (NSInteger) code
                     
{
    self = [super init];
    self.errorCode = code;
    self.errorMessage = reason;
    //self.errorData = data;
    return self;
}

- (NSString*) description {
    
    if(self.errorCode != 0){
        return [NSString stringWithFormat:@"Code: %zd Data: %@", self.errorCode, self.errorMessage];
    }else{
        return [NSString stringWithFormat:@"Error: %@" ,self.errorMessage];
    }
    
}
@end

