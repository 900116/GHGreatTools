//
//  GHGreatTools.h
//  GHGreatTools
//
//  Created by YongCheHui on 16/8/18.
//  Copyright © 2016年 ApesStudio. All rights reserved.
//

#import <AppKit/AppKit.h>

@class GHGreatTools;

static GHGreatTools *sharedPlugin;

@interface GHGreatTools : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end