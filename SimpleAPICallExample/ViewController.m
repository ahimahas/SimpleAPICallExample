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
    
    
    // url은 어딘가에 define으로 모아두면 좋을듯. 마땅한데가 없어서 그냥 써놨어요.
    // SampleAPIBuilder를 APIHandler 내부에서 처리하도록 했는데 그 이유는 APIHandler 를 실제 사용하는 ViewController에서까지 SampleAPIHandler를 알 필요가 있나해서 입니다.
    // 사용하는 입장에서는 APIHandler가 되는 뭐든 딱 하나만 알고 그것만 쓰면 내부적으로 처리되는게 편하지 않을까 하는 생각이예요.
    // 만약 SampleAPIBuilder 이외의 빌더가 사용되어야하고 언제나 교체 가능해야한다라고 한다면, 그건 APIHandler의 몫으로 처리하면 될듯합니다.
    
    [[APIHandler defaultAPIHandler] sendAPIRequestWithURL:@"http://coinabul.com/api.php" method:API_REQUEST_METHOD_GET completionBlock:^(NSDictionary *responseResult) {
        // do something
        
    } failBlock:^(NSError *error) {
        // do something
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
