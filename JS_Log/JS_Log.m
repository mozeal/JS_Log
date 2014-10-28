//
//  JS_Log.m
//  UIPlayground
//
//  Created by mozeal on 10/25/2557 BE.
//  Copyright (c) 2557 Jimmy Software. All rights reserved.
//

#import "JS_Log.h"

static JS_Log *__js_log__;

@interface JS_Log()
{
    
}
@end

@implementation JS_Log

- (id)init
{
    self = [super init];
    if( self )
    {
        __js_log__ = self;
    }
    return self;
}

+ (JS_Log *)getInstance
{
    if( __js_log__ )
        return __js_log__;
    
    JS_Log *a = [[JS_Log alloc] init];
    assert( a == __js_log__ );
    if( __js_log__ )
        return __js_log__;
    
    NSLog(@"%@", self);
    
    return nil;
}

- (void)addLog:(NSString *)str
{
    if( !self.logs ) {
        self.logs = [[NSMutableArray alloc] init];
    }
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:str, @"log", [NSDate date], @"time", nil];
    [self.logs addObject:dict];
}


@end

void JSLog(NSString *format, ...)
{
    va_list args;
    va_start(args, format);
    NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    NSLog( @"%@", str );
    JS_Log *log = [JS_Log getInstance];
    [log addLog:str];
}


    
