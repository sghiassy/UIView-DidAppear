//
//  UIView+viewDidAppear.m
//  UIViewWillAppear
//
//  Created by Shaheen Ghiassy on 3/23/18.
//

#import "UIView+Traversal.h"

static NSString *CONTENT_OFFSET = @"contentOffset";

@implementation UIView (viewDidAppear)

- (void)beginObservingForViewDidAppear {
    NSArray *superviews = self.getAllSuperviews;
    for (UIView *superview in superviews) {
        if([superview respondsToSelector:@selector(contentOffset)]) {
            [superview addObserver:self forKeyPath:CONTENT_OFFSET options:NSKeyValueObservingOptionNew context:nil];
        }
    }
}

- (void)endObservingForViewDidAppear {
    NSArray *superviews = [self getAllSuperviews];
    for (UIView *superview in superviews) {
        @try {
            [superview removeObserver:self forKeyPath:CONTENT_OFFSET];
        }
        @catch(id exception) { }
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:CONTENT_OFFSET]) {
        [self checkIfFrameIsVisible];
    }
}

-(void)checkIfFrameIsVisible {
    CGRect myFrameToWindow = [self.window convertRect:self.frame fromView:self];
    if(myFrameToWindow.size.width == 0 || myFrameToWindow.size.height == 0) return;

    if(CGRectContainsRect(self.window.frame, myFrameToWindow)) {
        // We are visible, do stuff now
        if ([self respondsToSelector:@selector(viewDidAppear)]) {
            [self viewDidAppear];
        }
    }
}

- (void)viewDidAppear {
    // no-op
    NSLog(@"wha");
}

@end

