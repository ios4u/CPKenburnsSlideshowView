//
//  CPInfiniteScrollView
//  CPKenBurnsSlideshowView-Demo
//
//  Created by Muukii on 4/7/14.
//  Copyright (c) 2014 Muukii. All rights reserved.
//

#import "CPKenBurnsInfiniteScrollView.h"

@interface CPKenBurnsInfiniteScrollView ()

@end

@implementation CPKenBurnsInfiniteScrollView
#pragma mark - Layout
// recenter content periodically to achieve impression of infinite scrolling
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.currentItem = 0;
    }
    return self;
}
- (void)recenterIfNecessary
{
    CGPoint currentOffset = [self contentOffset];
    CGFloat contentWidth = [self contentSize].width;
    CGFloat centerOffsetX = (contentWidth - [self bounds].size.width) / 2.0;
    CGFloat distanceFromCenter = (currentOffset.x - centerOffsetX);

//    NSLog(@"%f",distanceFromCenter);
    if (distanceFromCenter > 0) {
            //next page
        if (distanceFromCenter >= CGRectGetWidth(self.bounds)) {
            self.contentOffset = CGPointMake(ceilf(centerOffsetX), currentOffset.y);
            if ([self.callBack respondsToSelector:@selector(infiniteScrollView:didShowNextItem:currentItem:)]) {
                NSInteger nextItem = self.currentItem + 2;
                self.currentItem++;
                [self.callBack infiniteScrollView:self didShowNextItem:nextItem currentItem:self.currentItem];
            }
        }
    } else {
            //previous page
        if (distanceFromCenter <= -CGRectGetWidth(self.bounds)) {
            self.contentOffset = CGPointMake(ceilf(centerOffsetX), currentOffset.y);
            if ([self.callBack respondsToSelector:@selector(infiniteScrollView:didShowPreviousItem:currentItem:)]) {
                NSInteger previousItem = self.currentItem - 2;
                self.currentItem--;
                [self.callBack infiniteScrollView:self didShowPreviousItem:previousItem currentItem:self.currentItem];
            }
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self recenterIfNecessary];
}
@end
