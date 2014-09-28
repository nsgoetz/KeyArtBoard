//
//  ArtToAscii.swift
//  KeyArtBoardApp
//
//  Created by Mitchell Plamann on 9/28/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

func toAscii(image:Array<Array<Bool>>, scaleFactor:Int) -> String {
    let ySize = image.count
    let xSize = image[0].count
    
    var result = ""
    for y in 0..<ySize / scaleFactor {
        for x in 0..<xSize / scaleFactor {
            var next = " "
            for i in 0..<scaleFactor {
                for j in 0..<scaleFactor {
                    if image[y*scaleFactor + i][x*scaleFactor + j] {
                        next = "#"
                    }
                }
            }
            result += next
        }
        result += "\n"
    }
    return result
}

func isLineAtPoint(lines: [Line], point: (CGFloat, CGFloat)) -> Bool {
    for line in lines {
        if line.contains(point) {
            return true
        }
    }
    return false
}

func linesToAscii(lines:[Line], scaleFactor:Int) -> String {
    if scaleFactor <= 0 {
        return "ScaleFactor must be at least 1"
    }
    if lines.count == 0 {
        return ""
    }
    var xmin = lines[0].start.x
    var xmax = lines[0].start.x
    var ymin = lines[0].start.y
    var ymax = lines[0].start.y
    for line in lines {
        for pt in [line.start, line.end] {
            xmin = min(xmin, pt.x)
            xmax = max(xmax, pt.x)
            ymin = min(ymin, pt.y)
            ymax = max(ymax, pt.y)
        }
    }
    
    NSLog("From (%f,%f) to (%f,%f)", xmin.native, ymin.native, xmax.native, ymax.native)
    
    var result = ""
    var x = xmin
    var y = ymin
    while y < ymax {
        while x < xmax {
            var nextChar = " "
            loop: for i in 0..<scaleFactor {
                for j in 0..<scaleFactor {
                    if isLineAtPoint(lines, (x,y)) {
                        nextChar = "#"
                        //break loop
                    }
                }
            }
            x += CGFloat(scaleFactor)
            result += nextChar
        }
        y += CGFloat(scaleFactor)
        result += "\n"
    }
    return result
}