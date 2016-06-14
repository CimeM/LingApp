//
//  NSCommunicator.swift
//  LangLearnApp
//
//  Created by Martin Cimerman on 31/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import Foundation

class NSComunicator {
    
    //var doc = Document(title: "", author: "")
    
    
    
    func getAllTitles() -> [String]{
        
        let titles = getDictionaryFromNSUserData("titleList")
        
        return Array(titles.values)
    }
    
    
    /**
     
     Fetches data from NSUser space and creates new document
     return value is new document with all values
     */
    func getDocumentWithTitle(title : String) -> Document {
        
        let newDoc = Document(title: nil)
        
        
        let documentCretentials = getLibraryList()
        
        
        newDoc.constructorAddTitle(title)
        
        newDoc.constructorAddAuthor(documentCretentials[title]!)
        
        let contentKey = title + "content"
        
        let contentString = getDictionaryFromNSUserData(contentKey)
        newDoc.constructorAddContent(contentString)
        
        
        return newDoc
    }
    
    
    /**
     
     Get all titles and authors
     */
    func getLibraryList() -> [String: String]{
        
        //return getDictionaryFromNSUserData("libraryIndex") // uncoment for getting the data from NSU
        return ["Naslov": "Avtor", "Naslov1": "Avtor2", "Naslov2": "Avtor2", "Naslov3": "Avtor3"] // temporary data
        
    }
    
    func getStringFromNSUserData(key: String) -> String {
        
        if NSUserDefaults.standardUserDefaults().objectForKey(key) != nil {
            return  (NSUserDefaults.standardUserDefaults().objectForKey(key) as? String)!
        }
        else {
            //result = [String : String]()
            // no data exists
            //TODO Error log
            print("No data exist in NSUserDefaults space for \(key)")
            return ""
        }
    }
    
    
    func writeStringToNSUserData( data : String, key : String) {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue(data, forKey: key)
        userDefaults.synchronize()
        
    }
    
    
    
    func getDictionaryFromNSUserData(key : String) -> [String : String] {
        
        if NSUserDefaults.standardUserDefaults().objectForKey(key) != nil {
            return  (NSUserDefaults.standardUserDefaults().objectForKey(key) as? [String: String])!
        }
        else {
            // no data exists
            //TODO Error log
            print("No data exist in NSUserDefaults space for \(key)")
            return [:]
        }
        
    }
    
    func writeDictionaryToNSUserData( data : [String : String] , key : String ) {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue(data, forKey: key)
        userDefaults.synchronize()
        
    }
}