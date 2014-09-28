//
//  Line.swift
//  KeyArtBoardApp
//
//  Created by Eric on 9/27/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

class Line {
    var start: CGPoint
    var end: CGPoint
    
    init(start _start: CGPoint, end _end:CGPoint) {
        start = _start
        end = _end
    }
    
    func contains(point:(CGFloat,CGFloat)) -> Bool {
        let (x,y) = point
        if (x > start.x && x > end.x) ||
            (x < start.x && x < end.x) ||
            (y > start.y && y > end.y) ||
            (y < start.y && y < end.y) {
                return false
        }
        // deal with vertical line
        if (start.x == end.x) {
            return (abs(start.x - x) < 5)
        }
        let slope = (start.y - end.y) / (start.x - end.x)
        let yCalc = (x - start.x) * slope + start.y
        NSLog("(%f,%f) -> %f", x.native, y.native, yCalc.native)
        return (abs(yCalc - y) < 5)
    }
}