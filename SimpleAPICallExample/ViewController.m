//
//  ViewController.m
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "ViewController.h"
#import "SampleAPIBuilder.h"
#import "APIHandler.h"
#import "SimpleAPIRequest.h"
#import "SimpleJSONParser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[APIHandler defaultAPIHandler] sendAPIRequest:[SampleAPIBuilder buildAPI] completionHandler:^(BOOL isSuccess, NSDictionary *responseResult, NSError *error) {
        NSLog(@"\nParsed JSON\n%@",responseResult.description);
    }];
    
    
    // 테슷흐
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
