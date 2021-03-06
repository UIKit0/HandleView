//
//  NSView+SMCanvas.h
//  HandleView
//
//  Created by Stephan Michels on 27.10.10.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSView (SMHandleView)

- (void)bringSubviewToFront:(NSView *)subview;
- (NSRect)alignRectToBase:(NSRect)rect;

@end
