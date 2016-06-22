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
    
    
    
    
    func saveArrayToNS() -> Bool{
        
        let array = ["",""]
        
        userDefaults.setObject(array, forKey:"array")
        
        userDefaults.synchronize()

        
        return true
    }
    
    
}