//
//  NSUDComunication.swift
//  wordLearning
//
//  Created by Martin Cimerman on 22/06/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import Foundation

class NSUSerDefaultsComunication {
    
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    func saveWordList(wordList: [Word]){
        
        let encodedList = self.encodeWordList(wordList)
        self.saveArrayToNS(encodedList)
        
    }
    
    func loadWordList() -> [Word] {
        
        let encodedList = loadArrayFromNS()
        let wordList = decodeWordList(encodedList)
        return wordList
        
    }
    
    
    func encodeWordList(wordList: [Word]) -> [String] {
        
        var encodedArray = [String]()
        
        for word in wordList {
            
            encodedArray += [word.inputWord,
                             word.translatedWord,
                             word.fromLanguage,
                             word.toLanguage,
                             word.imageReference]
            
        }
        
        return encodedArray
        
    }
    
    func decodeWordList(decodingArray: [String]) -> [Word]{
        
        
        var wordList = [Word]()
        let numberOfLoops = decodingArray.count/5
        
        if numberOfLoops > 0 {
            for n in 0...(numberOfLoops-1) {
                let word = Word(inputWord: decodingArray[0+(n*5)],
                                translatedWord: decodingArray[1+(n*5)],
                                fromLanguage: decodingArray[2+(n*5)],
                                toLanguage: decodingArray[3+(n*5)],
                                imageReference: decodingArray[4+(n*5)])!
                
                wordList.append(word)
            
            }
        }
        
        
        return wordList
        
    }
    
    
    func loadArrayFromNS() -> [String] {
        
        var wordList = [String]()
        wordList = userDefaults.objectForKey("wordListid") as? [String] ?? []
        return wordList
    }
    
    func saveArrayToNS(savingArray: [String]) {
        
        userDefaults.setObject(savingArray, forKey:"wordListid")
        
        userDefaults.synchronize()

        
        
    }
    
    
}