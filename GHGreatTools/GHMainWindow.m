//
//  GHMainWindow.m
//  GHGreatTools
//
//  Created by YongCheHui on 16/8/18.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import "GHMainWindow.h"

@interface GHMainWindow ()

@end

@implementation GHMainWindow
- (id)init
{
    if (![super initWithWindowNibName:@"GHMainWindow"]) {
        return nil;
    }
    return self;
}

-(void)urlChange
{
    NSString* url = nil;
    switch (self.seg.selectedSegment) {
        case 0:
            url = @"http://www.bejson.com/jsonviewernew/";
            break;
        case 1:
            url = @"http://tool.chinaz.com/Tools/URLEncode.aspx";
            break;
        case 2:
            url = @"http://tool.chinaz.com/Tools/Base64.aspx";
            break;
        case 3:
            url = @"http://tool.chinaz.com/tools/md5.aspx";
            break;
        case 4:
            url = @"http://www.bejson.com/enc/sha/";
            break;
        case 5:
            url = @"http://www.atool.org/httptest.php";
            break;
        default:
            break;
    }
    [self.webView setMainFrameURL:url];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            });
}

+(BOOL)isSelectorExcludedFromWebScript:(SEL)selector
{
    return YES;
}

-(void)removeIDs:(NSArray*)ids sender:(WebView*)sender
{
    NSMutableString* js = [NSMutableString new];
    for (NSString* idSt in ids) {
        [js appendString:@"document.getElementById(\""];
        [js appendString:idSt];
        [js appendString:@"\").remove();"];
    }
    [sender stringByEvaluatingJavaScriptFromString:js];
}

-(void)removeClss:(NSArray*)ids sender:(WebView*)sender
{
    NSMutableString* js = [NSMutableString new];
    for (NSString* idSt in ids) {
        [js appendString:@"var t = document.getElementsByClassName(\""];
        [js appendString:idSt];
        [js appendString:@"\");"];
        //[js appendFormat:@"for (var i = 0; i < t.length; i++) {t[i].innerHTML = \"\";};"];
        [js appendFormat:@"for (var i = 0; i < t.length; i++) {t[i].remove();};"];
    }
    [sender stringByEvaluatingJavaScriptFromString:js];
}

- (void)webView:(WebView *)sender resource:(id)identifier didFinishLoadingFromDataSource:(WebDataSource *)dataSource
{
    if (self.seg.selectedSegment == 1 || self.seg.selectedSegment == 2 || self.seg.selectedSegment == 3) {
        NSArray* removeClss = @[@"ToolTop bor-b1s clearfix",@"ToolHead",@"ToolNavbar",@"wrapper02 ptb10 ToolsWrapIM clearfix",@"Tool-MainWrap wrapper",@"wrapper mt10",@"wrapper mt10 bor-b1s06 clearfix",@"GMFocusBox auto",@"GMFocusBox auto autohide",@"wrapper ptb10 mt10",@"puw100 h80 bor-t1s mt10 bg-white",@"Map-navbar wrapper mb10 clearfix"];
        [self removeClss:removeClss sender:self.webView];
        NSArray* removeIDs = @[@"ToolBox",@"toTop"];
        [self removeIDs:removeIDs sender:self.webView];
    }
    else if(self.seg.selectedSegment == 4)
    {
        NSArray* removeClss = @[@"navbar navbar-default",@"media",@"panel-footer",@"panel-heading"];
        [self removeClss:removeClss sender:self.webView];
    }
    else if(self.seg.selectedSegment == 5)
    {
        NSArray* removeClss = @[@"new_tools_list",@"divider",@"explainer",@"navbar fixed",@"oauth_login",@"table table-bordered content-table",@"menu_list",@"tool",@"site-nav",@"donate_qrcode",@"row footer",@"ds-thread",@"span five bdsharebuttonbox",@"span seven",@"adsbygoogle"];
        [self removeClss:removeClss sender:self.webView];
        NSArray* removeIds = @[@"qrcode_ad"];
        [self removeIDs:removeIds sender:self.webView];
    }
}


- (void)windowDidLoad {
    [super windowDidLoad];
    self.webView.resourceLoadDelegate = self;
    self.seg.selectedSegment = 0;
    self.seg.target = self;
    self.seg.action = @selector(urlChange);
    [self urlChange];
  
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
