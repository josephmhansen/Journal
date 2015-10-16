//
//  EntryController.swift
//  Journal
//
//  Created by Joseph Hansen on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
class EntryController {
     //Singleton
    static let sharedController = EntryController()
    
    //All entry Array
    var allEntry:[Entry] = []
    
    //Add Entry to Array
    func addEntry (entry: Entry) -> (){
        allEntry.append(entry)
    }
    
    //remove entry from array
    func removeEntry(entry:Entry) ->(){
        let index = self.allEntry.indexOf(entry)
        if let itemIndex = index {
            self.allEntry.removeAtIndex(itemIndex)
        }
    }
    
}