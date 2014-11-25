//
//  File.swift
//  Bresenham
//
//  Created by Rainer Schlönvoigt on 17/11/14.
//  Copyright (c) 2014 Rainer Schlönvoigt. All rights reserved.
//

import Foundation
import Cocoa

class BrezenhamView : NSView, NSGestureRecognizerDelegate {
    var points:[intPoint] = []
    let pixelSize:CGFloat = 6
    var p1:NSPoint!
    
    func gestureRecognizerShouldBegin(gestureRecognizer: NSGestureRecognizer) -> Bool {
        p1 = gestureRecognizer.locationInView(self)
        p1.x /= pixelSize
        p1.y /= pixelSize
        return true;
    }
    
    @IBAction func handlePan(recognizer:NSPanGestureRecognizer) {
        let translation = recognizer.translationInView(self)
        
        let p2 = NSPoint(x: (p1.x + translation.x/pixelSize), y: (p1.y + translation.y/pixelSize))
        
        points = bresenham(p1, p2)
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
