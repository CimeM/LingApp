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
    
    var word :Word?
    
    
    @IBOutlet var saveButton: UIBarButtonItem?
    @IBOutlet var TranslatorView: TranslatorUIView!
    //@IBOutlet var DrawingView: DrawingUIView!

    var translatorFrame =   CGRect(x: 0, y: 0, width: 0, height: 0)
    var drawingFrame =      CGRect(x: 0, y: 0, width: 0, height: 0)
    
    
    override func viewDidLoad() {
        
        navbuttonsSetup()
        //define UIview frame
        frameSetup()
        
        //create view
        translatorViewSetup()
        
    }
    
    @IBAction func unwindToTranslatorVC(segue: UIStoryboardSegue) {}
    
    //rename to retrieve word detalis
    func retrieveTranslatedWord () -> Word{
        
        // TODO retrieve languages and image
        let word = Word(inputWord: (self.TranslatorView.alphaInputField!.text)!,
                         translatedWord: (self.TranslatorView.betaInputField!.text)!,
                         fromLanguage: "",
                         toLanguage: "",
                         imageReference: "")
        
        print(self.TranslatorView.alphaInputField!.text)
        print(self.TranslatorView.betaInputField!.text)
        print(word)
        return word!
        
        
        
    }
    
    func transitionToDraw() {
        
        performSegueWithIdentifier("showDrawVC", sender: self)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        self.word = self.retrieveTranslatedWord()
        
        if (segue.identifier == "showDrawVC") {
            let vc = segue.destinationViewController as! DrawVC
            vc.selectedWord = self.word?.translatedWord ?? ""
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
    }
    
    func translatorViewSetup() {
        
        // create Translator UIView
        self.TranslatorView = TranslatorUIView(frame: translatorFrame)
        
        view.addSubview(TranslatorView)

        // if user selects a word from the list, write the word into the field
        if wordInHistoryList == true {
            
            
            self.TranslatorView.alphaInputField?.text = self.word?.inputWord
            
            self.TranslatorView.betaInputField?.text = self.word?.translatedWord
        }
        
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
        
        
        
    }
    
}