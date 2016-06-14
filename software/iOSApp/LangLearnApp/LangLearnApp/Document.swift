//
//  Document.swift
//  LangLearnApp
//
//  Created by Martin Cimerman on 31/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import Foundation

class Document {
    
    
    // MARK: document values
    private var title: String = ""
    private var author: String = ""
    private var content = [Language:String]() //
    private var documentContent : [String: String] = [:]

    var temporaryBookmark : Int  = 0 // when set to new value -> write to NS
    
    private var type: String = "" //
    
    var primaryLanguage : Language = .ENG //this is connected to the user?
    var secondaryLanguage : Language = .SI // this is connected to the user?
    var availableLanguages : [Language] = []
    
    init (title: String?) {
        self.temporaryBookmark = 0 // initially the book is unopened
        
        content = [ .SI : "Hitra lisica je skočila preko lenega psa.",
                    .ENG: "The quick brown fox jumps over the lazy dog."]
        
        documentContent = ["SLOVENIAN":"Hitra lisica je skočila preko lenega psa." ,
                           "ENGLISH":"The quick brown fox jumps over the lazy dog."]
        
        if title == nil {
            self.author = "nil"
            self.title  = "nil"
            self.availableLanguages = [.ENG]
        }
        else {
            documentConstructor(title!)
        }
        
    }
    
    /**
     fetches the data from NSUser based on title
    */
    
    func documentConstructor(key: String) {
        
        //reaches NSUser data and populates content with data
        // this must fill all variables this document has
        
    }
    
    enum Document {
        case Book
        case Aticle
        case Other
    }
    
    enum Language {
        case ENG
        case SI
        case FR
    }
    
    var languageDictionary: [String : Language] = ["SI":.SI,"ENG":.ENG,"FR":.FR]
    
        
    /**
     gets the sentence based on the bookmark if available
     
     */
    func getSentence(language : Language) -> String {
        
        let content =  self.content[language]!.componentsSeparatedByString(".")
        
        let numOfSentences = content.count
        
        if temporaryBookmark <= numOfSentences {
            return content[temporaryBookmark]
        }
        else {
            return "Content not available"
        }
        
    }
    
    /**
     
     if available get the next sentence. otherwise return current sentence
     also increases the temporary bookmark number
     
     */
    func getNextSentence(language: Language) -> String{
        
        if self.author == "nil" {
            return "document not found"
        } else {
            let content =  self.content[language]!.componentsSeparatedByString(".")
            
            let nextSentenceNum = temporaryBookmark + 1
            
            let numOfSentences = content.count
            
            if (nextSentenceNum) <= numOfSentences {
                temporaryBookmark = nextSentenceNum
                return content[nextSentenceNum]
            } else {
                return content[temporaryBookmark]
            }
            
        }
    }
    
    
    /**
     if available, get theprevious sentence
     otherwise return current sentence
     */
    func getPreviousSentence(language : Language) -> String {
        
        if self.author == "nil" {
            return "document not found"
        } else {
            let content =  self.content[language]!.componentsSeparatedByString(".")
            let previousSentenceNum = temporaryBookmark - 1
            let numOfSentences = content.count
            
            if previousSentenceNum >= numOfSentences {
                temporaryBookmark = previousSentenceNum
                return content[previousSentenceNum]
                
            } else {
                return content[temporaryBookmark]
            }
            
        }
        
    }
    
    
    func getAuthor() -> String{
        return self.author
    }
    func getTitle() -> String{
        return self.title
    }
    
    func constructorAddTitle( title: String) {
        
        self.title = title
        
    }
    
    func constructorAddAuthor( author: String) {
        
        self.author = title
        
    }
    
    func constructorAddContent(content : [String:String]) {
        
        
        for (languageStr,contentStr) in content {
            
            let languageEnum = languageDictionary[languageStr]
            
            self.content[languageEnum!] = contentStr
            
        }
        
        //return self
    }
    
}
