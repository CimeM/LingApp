//
//  TranslatorVC.swift
//  wordLearning
//
//  Created by Martin Cimerman on 17/06/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit


class TranslatorVC: UIViewController {

    var selectedWord = ""
    
    @IBOutlet var TranslatorView: TranslatorUIView!
    @IBOutlet var DrawingView: DrawingUIView!

    var translatorFrame =   CGRect(x: 0, y: 0, width: 0, height: 0)
    var drawingFrame =      CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        
        navbuttonsSetup()
        
    }
    
    @IBAction func unwindToTranslatorVC(segue: UIStoryboardSegue) {}
    
    func retrieveTranslatedWord () {
        
        self.selectedWord = self.TranslatorView.selectedWord
        
    }
    
    func transitionToDraw() {
        
        performSegueWithIdentifier("showDrawVC", sender: self)
        
        print("word saved")
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        self.retrieveTranslatedWord()
        
        if (segue.identifier == "showDrawVC") {
            let vc = segue.destinationViewController as! DrawVC
            vc.selectedWord = self.TranslatorView.selectedWord
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        
        frameSetup()
        
        self.TranslatorView = TranslatorUIView(frame: translatorFrame)
        
        //self.DrawingView = DrawingUIView(frame: drawingFrame)
        
        view.addSubview(TranslatorView)
    }
    
    func navbuttonsSetup() {
        let saveButton = UIBarButtonItem(title: "Save", style: .Done , target: self, action: nil)
        let drawButton = UIBarButtonItem(title: "Draw", style: .Done , target: self, action: #selector(TranslatorVC.transitionToDraw))
        
        self.navigationItem.rightBarButtonItems = [saveButton, drawButton]
    }
    
    func frameSetup(){
        self.translatorFrame =  CGRect(x: self.view.frame.origin.x,
                                       y: self.view.frame.origin.y + ((self.navigationController?.accessibilityFrame.height)! + (navigationController?.accessibilityFrame.origin.y)!) + 80,
                                       width: self.view.frame.width,
                                       height: 250)
        
//        self.drawingFrame = self.view.frame
//        self.drawingFrame.origin.y = (translatorFrame.height + translatorFrame.origin.y)
//        //self.drawingFrame.height = self.view.frame.height - drawingFrame.origin.y
    }
    
}