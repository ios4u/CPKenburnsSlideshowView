//
//  CPKenBurnsSlideshowView.h
//  CPKenBurnsSlideshowView-Demo
//
//  Created by Muukii on 4/7/14.
//  Copyright (c) 2014 Muukii. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CPKenBurnsImage;
@interface CPKenBurnsSlideshowView : UIView
- (id)initWithFrame:(CGRect)frame;

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, assign) BOOL slideshow;
@property (nonatomic, assign) CGFloat slideshowDuration;
@property (nonatomic, assign) CGFloat automaticFadeDuration;

@property (nonatomic, assign) Class titleViewClass;
@end
