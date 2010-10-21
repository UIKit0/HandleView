//
//  Canvas.m
//  HandleView
//
//  Created by Stephan Michels on 11.10.10.
//  Copyright 2010 Beilstein Institut. All rights reserved.
//

#import "Canvas.h"
#import "HandleView.h"


CGFloat CGFloatClamp(CGFloat value, CGFloat min, CGFloat max) {
	if (value > max)
		return max;
	else if (value < min)
		return min;
		
	return value;
}

@implementation Canvas

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)awakeFromNib {
	handleView1 = [[HandleView handleViewWithPosition:NSMakePoint(100, 50)] retain];
	handleView1.delegate = self;
	[self addSubview:handleView1];
	
	handleView2 = [[HandleView handleViewWithPosition:NSMakePoint(300, 150)] retain];
	handleView2.delegate = self;
	[self addSubview:handleView2];
}

- (NSPoint)handleView:(HandleView*)handleView willChangePosition:(NSPoint)position {
    if (handleView1 == handleView) {
        NSPoint center = NSMakePoint(100, 100);
        CGFloat dx = position.x - center.x;
        CGFloat dy = position.y - center.y;
        CGFloat length = hypotf(dx, dy);
        if (length == 0) {
            return NSMakePoint(150, 100);
        }
        CGFloat radius = 50;
        return NSMakePoint(center.x + dx * radius / length, center.y + dy * radius / length);
    } else if (handleView2 == handleView) {
        CGRect rect = NSRectToCGRect(self.bounds);
        return NSMakePoint(CGFloatClamp(position.x, CGRectGetMinX(rect), CGRectGetMaxX(rect)), 
                           CGFloatClamp(position.y, CGRectGetMinY(rect), CGRectGetMaxY(rect)));
    }
}

- (void)handleView:(HandleView*)handleView didChangePosition:(NSPoint)position {
	[self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)rect {
    // Drawing code here.
	[[NSColor redColor] set];
	NSRectFill(self.bounds);
	
	[[NSColor blackColor] set];
	
	NSBezierPath *circlePath = [NSBezierPath bezierPathWithOvalInRect:NSMakeRect(50, 50, 100, 100)];
	[circlePath stroke];
	
	[NSBezierPath strokeLineFromPoint:handleView1.position toPoint:handleView2.position];
}

@end
