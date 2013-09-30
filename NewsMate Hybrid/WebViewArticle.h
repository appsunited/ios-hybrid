//
//  WebViewArticle.h
//  NewsMate Hybrid
//
//  Created by Felix Weiß on 22.09.13.
//  Copyright (c) 2013 appsunited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewArticle : UIViewController <UIWebViewDelegate>
@property NSURL *url;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;

@end
