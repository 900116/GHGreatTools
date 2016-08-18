//
//  GHMainWindow.h
//  GHGreatTools
//
//  Created by YongCheHui on 16/8/18.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface GHMainWindow : NSWindowController<WebResourceLoadDelegate>
@property(nonatomic,weak)IBOutlet WebView* webView;
@property(nonatomic,weak)IBOutlet NSSegmentedControl* seg;
@end
