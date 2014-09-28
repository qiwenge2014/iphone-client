//
//  UIView+Utils.h
//  FishSaying
//
//  Created by aazhou on 1/29/12.
//  Copyright (c) 2012 joyotime. All rights reserved.
//

#define kSeperatorLineViewTag       8000001

@interface UIView (Utils)

@property(nonatomic,assign) CGPoint origin;
@property(nonatomic,assign) CGFloat originX;
@property(nonatomic,assign) CGFloat originY;
@property(nonatomic,assign) CGSize  size;
@property(nonatomic,assign) CGFloat  sizeW;
@property(nonatomic,assign) CGFloat  sizeH;
@property(nonatomic,assign) CGFloat  centerX;
@property(nonatomic,assign) CGFloat  centerY;

- (UIImage *)screenshot;

- (UIView*)firstResponder;
- (BOOL)findAndResignFirstResponder;
- (BOOL)hasFirstRespondor;

- (void)addSeperatorLine:(CGRect)frame;

@end
