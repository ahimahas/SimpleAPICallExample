//
//  APIHandler.h
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIResponseParser.h"
#import "SimpleAPIRequest.h"

#define API_REQUEST_METHOD_GET      @"GET"
#define API_REQUEST_METHOD_POST     @"POST"


typedef NS_ENUM(NSInteger, APIHandlerCancelPolicy){
    APIHandlerCancelPolicyAll,
    APIHandlerCancelPolicySameRequestOnly
};

@interface APIHandler : NSObject

@property (nonatomic) APIHandlerCancelPolicy cancelPolicy;
@property (nonatomic) NSMutableDictionary *apiRequests;

+ (APIHandler *)defaultAPIHandler;

- (void)sendAPIRequest:(SimpleAPIRequest *)apiRequest completionHandler:(void (^)(BOOL isSuccess, id responseResult, NSError* error))resultHandler;
- (void)cancelIdenticalToAPIRequest:(SimpleAPIRequest *)apiRequest;



- (void)sendAPIRequestWithURL:(NSString *)urlString method:(NSString *)method completionBlock:(void (^)(NSDictionary *responseResult))completionBlock failBlock:(void (^)(NSError *error))failBlock;

@end
