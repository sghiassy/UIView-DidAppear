//
//  Swizzler.m
//  UIViewDidAppear
//
//  Created by Shaheen Ghiassy on 3/25/18.
//

#import "Swizzler.h"
#import <objc/runtime.h>

@implementation Swizzler

+ (void)swap:(SEL)originalSelector to:(SEL)swizzledSelector on:(Class)class {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));

    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end

