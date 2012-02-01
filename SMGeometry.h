//
//  SMGeometry.h
//  HandleView
//
//  Created by Stephan Michels on 01.02.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import <Cocoa/Cocoa.h>

CGPoint CGPointSub(CGPoint point1, CGPoint point2);
CGFloat CGPointLength(CGPoint point);
CGPoint CGPointNormalize(CGPoint point);
CGPoint CGPointOrthogonal(CGPoint point);
CGPoint CGPointScaleAdd(CGPoint point1, CGPoint point2, CGFloat scale);
CGPoint CGPointScaleAdd2(CGPoint point1, CGPoint point2, CGFloat scale2, CGPoint point3, CGFloat scale3);