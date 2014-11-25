//
//  ViewController.swift
//  Bresenham
//
//  Created by Rainer Schlönvoigt on 17/11/14.
//  Copyright (c) 2014 Rainer Schlönvoigt. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    var p1:NSPoint!
    func gestureRecognizerShouldBegin(gestureRecognizer: NSGestureRecognizer) -> Bool {
        p1 = gestureRecognizer.locationInView(gestureRecognizer.view)
        
        p1.x /= (self.view as PointDrawingView).pixelSize
        p1.y /= (self.view as PointDrawingView).pixelSize
        return true;
    }
    
    @IBAction func handlePan(recognizer:NSPanGestureRecognizer) {
        let translation = recognizer.translationInView(recognizer.view)
        
        let pixelSize = (self.view as PointDrawingView).pixelSize
        
        let p2 = NSPoint(x: (p1.x + translation.x/pixelSize), y: (p1.y + translation.y/pixelSize))
        
        (self.view as PointDrawingView).setPoints(bresenham(p1, p2))
    }

}

