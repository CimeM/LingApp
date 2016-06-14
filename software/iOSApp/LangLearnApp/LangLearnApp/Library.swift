//
//  Library.swift
//  LangLearnApp
//
//  Created by Martin Cimerman on 31/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import Foundation

class Library {
    
    private var library = [String]()
    
    var NSComunication = NSComunicator()
    
    var index : [String] = []
    
    init() {
        index = NSComunication.getAllTitles()
    }
    
    
    func addDocument(url: String) -> Bool {
        self.library.append(url)
        return true
    }
    func deleteDocument(index: Int) -> Bool {
        library.removeAtIndex(index)
        //TODO error handling - check if book stilll exists in array
        return true
    }
    
    
    // returns list of all documents in the library
    func searchForDocument(id: String) -> Document? {
        
        let titlesIndex : [String] = []
        
        //search in local memory for titles
        //titlesIndex.append("title")
        
        return nil
    }
    
    func getDocumentsCredentialsfromNSU() -> [String: String]  {
        return NSComunication.getLibraryList()
    }
}
    