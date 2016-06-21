//
//  TranslatorVC.swift
//  wordLearning
//
//  Created by Martin Cimerman on 17/06/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit


class TranslatorVC: UIViewController {

    var selectedWord = "" // TODO -> change to translatedWord
    var wordInHistoryList = false
    
    var translatedWord = ""
    var inputWord = ""
    
    @IBOutlet var saveButton: UIBarButtonItem?
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
        
        //print("word saved")
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        self.translatedWord = TranslatorView.betaInputField?.text! ?? ""
        
        self.inputWord = TranslatorView.alphaInputField?.text ?? ""
            
        
        
        
        
        self.retrieveTranslatedWord()
        
        if (segue.identifier == "showDrawVC") {
            let vc = segue.destinationViewController as! DrawVC
            vc.selectedWord = self.TranslatorView.selectedWord
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        
        frameSetup()
        
        self.TranslatorView = TranslatorUIView(frame: translatorFrame)
        
        if wordInHistoryList == true {
            self.TranslatorView.selectedWord = self.selectedWord
            
        }
        
        view.addSubview(TranslatorView)
    }
    
    func navbuttonsSetup() {
        
        self.saveButton = UIBarButtonItem(title: "Save", style: .Done , target: self, action: #selector(TranslatorVC.saveWord))
        let drawButton = UIBarButtonItem(title: "Draw", style: .Done , target: self, action: #selector(TranslatorVC.transitionToDraw))
        
        
        
        if wordInHistoryList == true {
            self.navigationItem.rightBarButtonItem =  drawButton
        }
        else {
            self.navigationItem.rightBarButtonItems = [saveButton!, drawButton]
        }
        
       
    }
    
    
    func saveWord (){
        //dismissViewControllerAnimated(true, completion: nil)
        self.performSegueWithIdentifier("unwindToListVCID", sender: self)
    
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