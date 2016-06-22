//
//  WordList.swift
//  wordLearning
//
//  Created by Martin Cimerman on 22/06/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import Foundation


struct Word {
    var inputWord : String
    var translatedWord: String
    var fromLanguage: String
    var toLanguage: String
    var imageReference: String
    
    init? (inputWord: String, translatedWord: String,  fromLanguage: String, toLanguage: String, imageReference: String) {
    
        self.inputWord = inputWord
        self.translatedWord = translatedWord
        self.fromLanguage = fromLanguage
        self.toLanguage = toLanguage
        self.imageReference = imageReference
        
        if inputWord.isEmpty {
            
            return nil
        }
    }
}