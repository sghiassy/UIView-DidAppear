//
//  Swizzler.h
//  UIViewDidAppear
//
//  Created by Shaheen Ghiassy on 3/25/18.
//

#import <Foundation/Foundation.h>

@interface Swizzler : NSObject

+ (void)swap:(SEL)originalSelector to:(SEL)swizzledSelector on:(Class)class;

@end
