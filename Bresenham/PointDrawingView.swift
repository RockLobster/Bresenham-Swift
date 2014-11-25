//
//  File.swift
//  Bresenham
//
//  Created by Rainer Schlönvoigt on 17/11/14.
//  Copyright (c) 2014 Rainer Schlönvoigt. All rights reserved.
//

import Foundation
import Cocoa

class PointDrawingView : NSView, NSGestureRecognizerDelegate {
    var points:[intPoint] = []
    var pixelSize:CGFloat = 3
    
    func setPoints(pointsToDraw: [intPoint]) {
        points = pointsToDraw
        self.needsDisplay = true
    }
    
    func setPixelSize(newSize: CGFloat) {
        pixelSize = newSize;
        self.needsDisplay = true
    }
    
    override func drawRect(dirtyRect: NSRect) {
        let context = NSGraphicsContext.currentContext()?.CGContext
        
        CGContextSetRGBFillColor(context, 0, 0, 0, 1)
        CGContextFillRect(context, CGRectMake(0, 0, dirtyRect.width, dirtyRect.height))
        
        CGContextSetRGBFillColor(context, 1, 1, 1, 1)
        for p in points {
            let pixRect = CGRectMake(
                CGFloat(p.x)*pixelSize,
                CGFloat(p.y)*pixelSize,
                CGFloat(pixelSize),
                CGFloat(pixelSize))
            CGContextFillRect(context, pixRect)
        }
    }
}
