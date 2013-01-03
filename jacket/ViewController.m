//
//  ViewController.m
//  jacket
//
//  Created by michal lukasiewicz on 1/2/13.
//  Copyright (c) 2013 jackets. All rights reserved.
//

#import "ViewController.h"
#import "BlocksKit.h"
#import "Network.h"
#import "RKLog.h"
#import "HLDeferred.h"

@interface ViewController ()

@end

@implementation ViewController {
    UIAlertView *alert;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.



//    RKLogConfigureByName("RestKit", RKLogLevelTrace);
//    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
//    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);

    RKClient *client = [RKClient clientWithBaseURLString:@"http://www.wp.pl"];

    HLDeferred *deferred = [HLDeferred new];

    [deferred then:(id) ^(id response) {
        alert = [[UIAlertView alloc] initWithTitle:@"Data from server" message:[response bodyAsString]];
        [alert addButtonWithTitle:@"ok" handler:^{
            NSLog(@"niezle");
        }];

        [alert show];
    }];

    [client get:@"https://gist.github.com/raw/4442387/3f131c40c6ea5b2ffbd78670ccbbfddd3f8e7f30/gistfile1.txt" usingBlock:^(RKRequest *request) {
        request.delegate = self;

        request.onDidLoadResponse = ^(RKResponse *response) {
            NSLog(@"response:%@", response);
            [deferred takeResult:response];
        };

        request.onDidFailLoadWithError = ^(NSError *error) {
            NSLog(@"error2:%@", error);
        };
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)request:(RKRequest *)request didReceiveResponse:(RKResponse *)response {
    NSLog(@"ok");
}

- (void)request:(RKRequest *)request didFailLoadWithError:(NSError *)error {
    NSLog(@"fail");
}

@end
