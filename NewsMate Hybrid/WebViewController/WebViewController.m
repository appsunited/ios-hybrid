//
//  WebViewController.m
//  NewsMate Hybrid
//
//  Created by Felix Weiß on 21.09.13.
//  Copyright (c) 2013 appsunited. All rights reserved.
//

#import "WebViewController.h"
#import "WebViewArticle.h"

@implementation WebViewController
@synthesize webView;
@synthesize mobileURL;

- (void)showUrl:(NSArray *)urlJS
{
    // JS sends the url of a snippet as a string
    // Objective-C slices urlJS and returns an odd array with items seperated by a slash (/)
    NSMutableString *url = [[NSMutableString alloc] init];
    [url appendString:@"http://"];
    for (NSString *slice in urlJS) {
        [url appendString:slice];
        [url appendString:@"/"];
    }
    // Remove last slash of url via substringToIndex
    self.mobileURL = [NSURL URLWithString:[url substringToIndex:[url length]-1]];
    [self performSegueWithIdentifier:@"ShowArticle" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowArticle"]) {
        WebViewArticle *article = [segue destinationViewController];
        article.url = self.mobileURL;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_wood.png"]];
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    self.webView = [[UIWebView alloc] initWithFrame:frame];
    self.webView.backgroundColor = [UIColor clearColor];
    self.webView.opaque = NO;
    [self.view addSubview:webView];
    
    //UIWebViewDelegate will be self
    [webView setDelegate:self];
    
    [self loadPageWithURL:@"http://newsmate"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.webView = nil;
}

/* Loads a URL string into the webview */
- (void)loadPageWithURL:(NSString *)url
{
    NSURL *theURL = [NSURL URLWithString:url];
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:theURL];
    [webView loadRequest:theRequest];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //This will catch clicked links and location changes made from Javascript, but no other request types
    if (navigationType == UIWebViewNavigationTypeLinkClicked || navigationType == UIWebViewNavigationTypeOther) {
        NSURL *URL = [request URL]; //Get the URL
        //The [URL scheme] is the "http" or "ftp" portion, for example
        //so let's make one up that isn't used at all -&gt; "objc"
        if ( [[URL scheme] isEqualToString:@"objc"] ) {
            //The [URL host] is the next part of the link
            //so we can use that like a selector
            NSString *selectorName = [URL host];
            id data = nil;
            NSMutableArray *parameters = [NSMutableArray array];
            
            if ( ![[URL path] isEqualToString:@""] ) {
                selectorName =  [NSString stringWithFormat:@"%@:", selectorName];
                parameters = [NSMutableArray arrayWithArray: [[URL path] componentsSeparatedByString:@"/"] ];
                [parameters removeObjectAtIndex:0]; //first object is just a slash "/"
                
                if ( [parameters count] == 1 ) {
                    data = [parameters objectAtIndex:0];
                } else {
                    data = parameters;
                }
            }
            SEL method = NSSelectorFromString( selectorName );
            
            if ([self respondsToSelector:method]) {
                //This line may give a warning but that's ok, we are being memory concious
                // See: http://stackoverflow.com/questions/7017281/performselector-may-cause-a-leak-because-its-selector-is-unknown
                [self performSelector:method withObject:data];
            }
            return NO;
        }
    }
    return YES;
}

@end