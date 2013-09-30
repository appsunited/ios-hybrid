//
//  WebViewArticle.m
//  NewsMate Hybrid
//
//  Created by Felix Weiß on 22.09.13.
//  Copyright (c) 2013 appsunited. All rights reserved.
//

#import "WebViewArticle.h"

@implementation WebViewArticle
@synthesize url, webView;

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.loader startAnimating];
    self.loader.hidden = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.loader stopAnimating];
    self.loader.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlReq];
}

@end
