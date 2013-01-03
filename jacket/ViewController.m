//
//  ViewController.m
//  jacket
//
//  Created by michal lukasiewicz on 1/2/13.
//  Copyright (c) 2013 jackets. All rights reserved.
//

#import "ViewController.h"
#import "BlocksKit.h"

@interface ViewController ()

@end

@implementation ViewController {
    UIAlertView *alert;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    alert = [[UIAlertView alloc] initWithTitle:@"T" message:@"ASd"];
    [alert addButtonWithTitle:@"hello" handler:^{
        NSLog(@"niezle");
    }];

    [alert show];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
