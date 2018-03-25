//
//  UIView+Load.m
//  UIViewDidAppear
//
//  Created by Shaheen Ghiassy on 3/25/18.
//

#import "UIView+Load.h"
#import "Swizzler.h"
#import "UIView+viewDidAppear.h"


@interface UIView ()

- (UIViewController *)viewController;

@end

@implementation UIView (Loader)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [Swizzler swap:@selector(didMoveToWindow) to:@selector(xxx_didMoveToWindow) on:[self class]];
    });
}

- (void)xxx_didMoveToWindow {
    [self xxx_didMoveToWindow];

    if (self.window != nil) {
        [self beginObservingForViewDidAppear];
    } else {
        [self endObservingForViewDidAppear];
    }
}

@end
