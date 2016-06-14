//
//  librarian.swift
//  LangLearnApp
//
//  Created by Martin Cimerman on 31/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

struct Librarian {
    
    var localLibrary = Library()
    
    func getDocumentByTitle( title: String) -> Document {
        
        
        if let result = localLibrary.searchForDocument(title) {
            return result
        }
        else {
            print("error document not found")
            
            let resultingemptyDocument = Document(title: nil)
            resultingemptyDocument.constructorAddTitle("nil")
            resultingemptyDocument.constructorAddAuthor("nil")
            return resultingemptyDocument
        }
        
    }
    
    
    func findOnlineSources() -> [String] {
        //load list of all available subscriptions
        return []
    }
    
    
    
}


