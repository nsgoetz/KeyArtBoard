//
//  DrawView.swift
//  KeyArtBoardApp
//
//  Created by Eric on 9/27/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var lines: [Line] = []
    var lastPoint: CGPoint?
    var newPoint: CGPoint?
    var context = UIGraphicsGetCurrentContext()
    var image: UIImage?

    
    required init(coder aDecoder: (NSCoder!)) {
        super.init(coder: aDecoder)
    }
    override func touchesBegan(touches: (NSSet!), withEvent event: (UIEvent!)) {
        if let point = touches.anyObject()?.locationInView(self){
            lastPoint = touches.anyObject()?.locationInView(self)
        }
    }
    override func touchesMoved(touches: (NSSet!), withEvent event: (UIEvent!)) {
        if let touch = touches.anyObject() as? UITouch{
            newPoint = touch.locationInView(self)
        }
        lines.append(Line(start: lastPoint!, end: newPoint!))
        lastPoint = newPoint!
        
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        
        CGContextBeginPath(context)
        for line in lines {
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
            
        }
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1)
        CGContextSetLineWidth(context, 5)
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextStrokePath(context)
        image = UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
    // Drawing code
    }
    */
    
}
