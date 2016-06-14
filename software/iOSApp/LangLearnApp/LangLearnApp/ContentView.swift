//
//  ContentView.swift
//  LangLearnApp
//
//  Created by Martin Cimerman on 12/06/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import Foundation
import UIKit

class ContentView : UIView {
    
    var librarian = Librarian()
    var alphaWindow = CALayer()
    var betaWindow = CALayer()
    var alphaWindowText = CATextLayer()
    var betaWindowText = CATextLayer()
    var contentID = ""
    var progresBar = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        //self.contentID = contentID
        
        
        self.alphaWindow.frame = CGRect(x: frame.origin.x,
                                        y: frame.origin.y,
                                        width: frame.width,
                                        height: frame.height/2)
        self.betaWindow.frame = CGRect(x: frame.origin.x,
                                       y: frame.origin.y+frame.height/2,
                                       width: frame.width,
                                       height: frame.height/2)
        let progresBarFrameHeight = CGFloat(40)//fixed
        self.progresBar.frame = CGRect(x: frame.origin.x, y: frame.height-progresBarFrameHeight, width: frame.width, height: progresBarFrameHeight)
        self.textContentSetup()
        self.progresBarInsert()
        self.insertContentToTextLayers()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func progresBarInsert(){
        
        UIColor.blackColor().setStroke()
        self.progresBar.backgroundColor = UIColor.lightGrayColor().CGColor
        
        let progresruler = UIBezierPath()
        
        progresruler.moveToPoint( CGPoint(x: self.progresBar.frame.origin.x + 20,
            y: self.progresBar.frame.height/2 ))
        progresruler.addLineToPoint(CGPoint(x: self.progresBar.frame.origin.x + self.progresBar.frame.width - 20, y: self.progresBar.frame.height/2))
        progresruler.lineWidth = 2
        progresruler.stroke()
        
        //progresBar.addSublayer(progresruler)
        self.layer.addSublayer(self.progresBar)
        
    }
    
    func textContentSetup () {
        //alpha
        self.alphaWindowText.fontSize = 25
        self.alphaWindowText.frame = CGRect(x: 20,
                                            y: self.alphaWindow.frame.height/2,
                                            width: self.alphaWindow.frame.width-40,
                                            height: self.alphaWindow.frame.height/0.5)
        
        self.alphaWindowText.alignmentMode = "center"
        self.alphaWindowText.string = "dsfdsfds"
        self.alphaWindowText.foregroundColor = UIColor.blackColor().CGColor
        
        //beta
        self.betaWindowText.fontSize = self.alphaWindowText.fontSize
        self.betaWindowText.frame = CGRect(x: 20,
                                           y: self.betaWindow.frame.height/4,
                                           width: self.betaWindow.frame.width-40,
                                           height: self.betaWindow.frame.height/0.5)
        
        self.betaWindowText.alignmentMode = "center"
        
        self.betaWindowText.string = "dsf"
        self.betaWindowText.foregroundColor = UIColor.blackColor().CGColor
        self.alphaWindowText.wrapped = true
        self.betaWindowText.wrapped = true
        
        //self.betaWindowText.alignmentMode = "justified"
        
        
        self.alphaWindow.addSublayer(self.alphaWindowText)
        
        self.betaWindow.addSublayer(self.betaWindowText)
        
        
        self.layer.addSublayer(self.betaWindow)
        self.layer.addSublayer(self.alphaWindow)
        
    }
    
    func insertContentToTextLayers() {
        
        let document = self.librarian.getDocumentByTitle(self.contentID)
        //todo get languages... 
        print(document.getSentence(.SI))
        
        self.alphaWindowText.string = "Quick brown fox jumped over a lazy dog.Quick brown fox jumped over a lazy dog."
        self.betaWindowText.string = "Quick brown fox jumped over a lazy dog.Quick brown fox jumped over a lazy dog.Quick brown fox jumped over a lazy dog."
        self.alphaWindow.addSublayer(alphaWindowText)
        self.betaWindow.addSublayer(betaWindowText)
        
    }
}