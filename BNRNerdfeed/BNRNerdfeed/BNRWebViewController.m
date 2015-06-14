//
//  BNRWebViewController.m
//  BNRNerdfeed
//
//  Created by 逯晓瞳 on 15/6/13.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRWebViewController.h"

@interface BNRWebViewController ()

@end

@implementation BNRWebViewController

- (instancetype)init
{
    self = [super init];
    
    if ( self ) {
        UIWebView *webView = [[UIWebView alloc] init];
        webView.delegate = self;
        
        self.view = webView;
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = self;

    NSURL *url = [NSURL URLWithString:self.webUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];

    self.view = webView;
    
    
    NSLog(@"%@", self.webUrl);
}


@end
