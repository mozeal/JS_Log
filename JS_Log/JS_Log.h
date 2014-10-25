//
//  JS_Log.h
//  UIPlayground
//
//  Created by mozeal on 10/25/2557 BE.
//  Copyright (c) 2557 Jimmy Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JS_Log : NSObject
{
    
}
@property (nonatomic, strong) NSMutableArray *logs;

+ (JS_Log *)getInstance;


@end

void JSLog(NSString *format, ...);
