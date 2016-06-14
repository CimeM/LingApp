//
//  ProgressBarView.swift
//  LangLearnApp
//
//  Created by Martin Cimerman on 14/06/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//


import UIKit

class ProgressBarView: UIView {

    var status = 0
    var statusIndicator = UIBezierPath()
    var statusDot = CALayer()
    let sidepadding = CGFloat(20)
    let startusText = CATextLayer()
    
    override func drawRect(rect: CGRect) {
        //progress bar
        UIColor.lightGrayColor().setStroke()
        let progresruler = UIBezierPath()
        progresruler.lineWidth = 1
        progresruler.moveToPoint( CGPoint(x: self.frame.origin.x + sidepadding,
            y: frame.height-self.frame.height/2 ))
        print(CGPoint(x: self.frame.origin.x + 20,
            y: self.frame.height/2 ))
        
        progresruler.addLineToPoint(CGPoint(x: self.frame.width - sidepadding,
            y: frame.height/2))
        
        progresruler.closePath()
        progresruler.stroke()

    }
    
    func status(current: Int, all: Int){
        
        let position = (CGFloat(Double(current)/Double(all)) * (frame.width - (2*sidepadding))) + sidepadding
        let dotDimention = CGFloat(5)
        print(CGFloat(current/all))
        let dotRect = CGRect(x: position,
                             y: frame.height/2 - dotDimention/2,
                             width: dotDimention,
                             height: dotDimention)
        statusDot.frame = dotRect
        
        statusDot.backgroundColor = UIColor.orangeColor().CGColor
        statusDot.cornerRadius = dotDimention/2
        
        self.layer.addSublayer(statusDot)
        
        addTextLayer(current, all: all)
    }
    
    
    func addTextLayer(current: Int, all: Int) {
        
        startusText.string = "\(current) out of \(all)"
        startusText.fontSize = 10
        startusText.foregroundColor = UIColor.darkGrayColor().CGColor
        startusText.frame = CGRect(x: sidepadding,
                                  y: frame.height/2 + startusText.fontSize*0.2 ,
                                  width: frame.width - (2*sidepadding),
                                  height: frame.height/2)
        startusText.alignmentMode = "center"
        layer.addSublayer(startusText)
    }
    
    
    
}
