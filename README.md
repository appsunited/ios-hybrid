## Hybrid iOS App

This is a sample how to connect an iOS app and server-side web pages. For this sample a news aggregator is built. To keep it simple the backend is using Yahoo Pipes, which aggregates different news web pages. It's requesting RSS feeds and also scraping HTML by some online news returning as JSON.
![NewsMate Hybrid App](https://raw.github.com/appsunited/ios-hybrid/master/Server/images/newsmate-screenshot.png "NewsMate Hybrid App")


### Clone Repo
```
git clone git@github.com:appsunited/ios-hybrid.git
```

### Up and Running
1. Copy all files in `/Server` to your web server.
2. In `WebViewController.m` line 52 change the path `[self loadPageWithURL:@"http://newsmate"];` where you have stored the `/Server` files.
3. Run iOS Simulator.


### Next Steps ###
1. Add another UIViewController in front of loaded news snippets. A list or table to select different news sources. This also should be an UIWebView requesting a list with topics and/or online news papers.
2. Refactor the `- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest` method, also create required classes. Review architecture issuees.
3. Implement the Observer design pattern and find an approach to listen, observe or notify - also called Broadcaster/Listener, Publish/Subscribe or Notifications.


### Hybrid Apps ###
* Cross platform code
* Rapid development
* Instant updates
* Bad Performance - 3x slower, JS Engine Nitro isn't supported in UIWebView
* Presentation and layout issues
* JS Execution time is limited (10s on iOS)


### Native ###
* High Performance - best for hardware intensive operations, iOS JavaScriptCore
* Native user experience - effects and animations
* Mobile Safari has better caching and asynchronous multithreading


### Frameworks ###
* UIWebView Bridge - PhoneGap, trigger.io
* Custom JavaScriptCore - Appcelerator Titanium
* Gaming - Spaceport, ImpactJS, CocoonJS


### JS - Objective-C ###
`[webViewObject stringByEvaluatingJavaScriptFromString:@"myJavascriptFunction()"];`


### Performance ###
* Native Code is ~3x faster than JS (ranges in 2x-9x)
* MBP vs. iPhone is a factor of 10.
* The performance between Chrome 8 and Chrome 29 is a flatline. If the web feels faster, that is probably because you’re running a faster computer, but it has nothing to do with improvements to Chrome.

![iOS Safari Browser](https://raw.github.com/appsunited/ios-hybrid/master/Server/images/ios_safari_browser.png "iOS Safari Browser")
![UIWebView Browser](https://raw.github.com/appsunited/ios-hybrid/master/Server/images/ios_uiwebview_browser.png "UIWebView Browser")


### Apple Documentation ###
"JavaScript execution time is limited to 10 seconds for each top-level entry point. If your script executes for more than 10 seconds, the web view stops executing the script. This is likely to occur at a random place in your code, so unintended consequences may result. This limit is imposed because JavaScript execution may cause the main thread to block, so when scripts are running, the user is not able to interact with the webpage. JavaScript allocations are also limited to 10 MB. The web view raises an exception if you exceed this limit on the total memory allocation for JavaScript."


### Google about JS ###
They think that JavaScript is facing a performance wall:
"Complex web apps–the kind that Google specializes in–are struggling against the platform and working with a language that cannot be tooled and has inherent performance problems."


### Read more ###
* http://www.whitneyland.com/2013/08/accelerated-hybrid-mobile-apps-the-sweet-spot.html
* https://www.cocoacontrols.com/posts/a-primer-on-hybrid-apps-for-ios
* http://sealedabstract.com/rants/why-mobile-web-apps-are-slow/
* http://de.slideshare.net/charlesying/best-practices-hybrid-mobile-native-web-apps
* http://blog.cuelogic.co.in/bridging-between-objective-c-and-javascript
* http://www.bitwit.ca/blog/an-native-ios-web-app-tutorialtemplate/
* http://sketchytech.blogspot.de/2012/04/uiwebview-javascript-and-objective-c.html
* http://blog.grio.com/2012/07/uiwebview-javascript-to-objective-c-communication.html
* http://warmfuzzyapps.com/2011/08/fun-with-uiwebview/