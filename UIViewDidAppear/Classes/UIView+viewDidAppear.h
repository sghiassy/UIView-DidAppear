//
//  UIView+viewDidAppear.h
//  UIViewWillAppear
//
//  Created by Shaheen Ghiassy on 3/23/18.
//

#import <UIKit/UIKit.h>

@interface UIView (viewDidAppear)

- (void)viewDidAppear;

- (void)beginObservingForViewDidAppear;
- (void)endObservingForViewDidAppear;

@end

