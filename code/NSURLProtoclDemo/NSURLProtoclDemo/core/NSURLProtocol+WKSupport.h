//
//  NSURLProtocol+WKSupport.h
//  NSURLProtoclDemo
//
//  Created by 李昌庆 on 2017/3/3.
//  Copyright © 2017年 李昌庆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLProtocol (WKSupport)
+ (void)wk_registerScheme:(NSString*)scheme;

+ (void)wk_unregisterScheme:(NSString*)scheme;

@end
