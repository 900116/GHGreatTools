//
//  NSObject_Extension.m
//  GHGreatTools
//
//  Created by YongCheHui on 16/8/18.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//


#import "NSObject_Extension.h"
#import "GHGreatTools.h"

@implementation NSObject (Xcode_Plugin_Template_Extension)

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[GHGreatTools alloc] initWithBundle:plugin];
        });
    }
}
@end
