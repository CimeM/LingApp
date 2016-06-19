//
//  TranslatorUIView.swift
//  wordLearning
//
//  Created by Martin Cimerman on 17/06/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit
import FGTranslator

class TranslatorUIView: UIView {

    var translator = FGTranslator(bingAzureClientId: "fgtranslator-demo", secret: "GrsgBiUCKACMB+j2TVOJtRboyRT8Q9WQHBKJuMKIxsU=")

    
    @IBOutlet var activityIndicator: UIActivityIndicatorView?
    @IBOutlet var alphaInputField: UITextField?
    @IBOutlet var betaInputField: UITextField?
    @IBOutlet var submitButton: UIButton?
    var selectedWord = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func setup(){
        
        self.backgroundColor = UIColor.clearColor()
        
        let inputTextFieldHeight = CGFloat(70)
        
        let textFieldSize = CGSize(width: self.frame.width - 40, height: inputTextFieldHeight)
        print(frame)
        let alphaTextWindowStart = CGPoint(x: 20, y: 0)
        let betaTextWindowStart = CGPoint(x: 20, y: inputTextFieldHeight + 5 )
        let submitButtonStart = CGPoint(x: 20, y: (inputTextFieldHeight*2) + 5*2)
        
        self.alphaInputField = UITextField(frame: CGRect(origin: alphaTextWindowStart, size: textFieldSize))
        self.alphaInputField?.backgroundColor = UIColor.clearColor()
        self.alphaInputField?.layer.cornerRadius = 8
        alphaInputField!.layer.borderColor = (UIColor.darkGrayColor()).CGColor;
        alphaInputField!.layer.borderWidth = 1.0
        alphaInputField!.font = .systemFontOfSize(26)
        alphaInputField?.textAlignment = .Center
        alphaInputField?.text = self.selectedWord
        
        self.betaInputField = UITextField(frame: CGRect(origin: betaTextWindowStart, size: textFieldSize))
        betaInputField!.backgroundColor = UIColor.clearColor()
        betaInputField?.layer.cornerRadius = 8
        betaInputField!.layer.borderColor = (UIColor.darkGrayColor()).CGColor;
        betaInputField!.layer.borderWidth = 1.0
        betaInputField!.font = .systemFontOfSize(26)
        betaInputField?.textAlignment = .Center
        
        self.addSubview(betaInputField!)
        self.addSubview(alphaInputField!)
        
        
        
        submitButton = UIButton(frame: CGRect(origin: submitButtonStart, size: textFieldSize))
        
        submitButton?.setTitle("Translate", forState: .Normal)
        submitButton?.backgroundColor = UIColor.whiteColor()
        submitButton?.setTitleColor(UIColor.blackColor(), forState: .Normal)
        submitButton?.layer.cornerRadius = 8
        //submitButton?.layer.borderColor = (UIColor.grayColor()).CGColor;
        submitButton?.layer.borderWidth = 1
        submitButton?.addTarget(self, action: #selector(translate), forControlEvents: .TouchUpInside)
        submitButton?.setTitleColor(UIColor.lightGrayColor(), forState: .Disabled)
        addSubview(submitButton!)
        
        
        
        let indicatorWidthDimention = CGFloat(70)
        self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        self.activityIndicator!.frame = CGRect(x: frame.width/2-indicatorWidthDimention/2,
                                               y: indicatorWidthDimention,
                                               width: indicatorWidthDimention,
                                               height: indicatorWidthDimention)
        
        
        addSubview(self.activityIndicator!)
    }

    
    func translate() {
        
        print(self.alphaInputField?.text)
        self.betaInputField?.text = ""
        self.submitButton?.enabled = false
        self.submitButton?.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.activityIndicator!.startAnimating()
        self.translator.translateText(alphaInputField?.text, completion: {(error, translation,sourceLanguage) in
        
            if (error != nil) {
                
                
            }
            else {
                self.betaInputField?.text = translation
                self.selectedWord = translation
                self.activityIndicator!.stopAnimating()
                self.submitButton?.enabled = true
                self.submitButton?.layer.borderColor = UIColor.blackColor().CGColor
            }
        
        })
        
        
        //self.selectedWord = (self.betaInputField?.text)!
        
    }
    
    func getListofLanguages() {
        
        self.translator.supportedLanguages({(error, languageCodes) in
        
            if (error != nil) {
                print(error)
            }
            else {
                print("\(languageCodes)")
            }
            
        
        })
        
    }
    
    
}
