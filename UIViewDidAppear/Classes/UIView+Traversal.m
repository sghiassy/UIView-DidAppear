//
//  UIView+Traversal.m
//  UIViewWillAppear
//
//  Created by Shaheen Ghiassy on 3/23/18.
//

@implementation UIView (Traversal)

- (NSArray *)getAllSuperviews {
    NSMutableArray *superviews = [[NSMutableArray alloc] init];

    if(self.superview == nil) return nil;

    [superviews addObject:self.superview];
    [superviews addObjectsFromArray:[self.superview getAllSuperviews]];

    return superviews;
}

- (BOOL)viewIsChildOfViewWithAccessibilityIdentifier:(NSString *)accessibililityIdentifier {
    if ([self.superview.accessibilityIdentifier isEqualToString:accessibililityIdentifier]) {
        return YES;
    }

    if (self.superview != nil) {
        return [self.superview viewIsChildOfViewWithAccessibilityIdentifier:accessibililityIdentifier];
    } else {
        return NO;
    }
}

@end
