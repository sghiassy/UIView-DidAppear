//
//  UIView+Traversal.h
//  UIViewWillAppear
//
//  Created by Shaheen Ghiassy on 3/23/18.
//

#import <UIKit/UIKit.h>

@interface UIView (Traversal)

- (BOOL)viewIsChildOfViewWithAccessibilityIdentifier:(NSString *)accessibililityIdentifier;
- (NSArray *)getAllSuperviews;

@end

