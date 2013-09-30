//
//  WebViewController.h
//  NewsMate Hybrid
//
//  Created by Felix Weiß on 21.09.13.
//  Copyright (c) 2013 appsunited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@property NSURL *mobileURL;

-(void)loadPageWithURL:(NSString *)url;

@end
