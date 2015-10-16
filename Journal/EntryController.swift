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
    var allEntry:[Entry]
    init(){
        self.allEntry = []
        self.loadFromSave()
    }
    
    
    //Add Entry to Array
    func addEntry (entry: Entry) -> (){
        allEntry.append(entry)
        self.saveToSave()
    }
    func loadFromSave(){
        let entriesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey("allEntry") as? [Dictionary<String,AnyObject>]
        if let entryDictionary = entriesFromDefaults{
            self.allEntry = entryDictionary.map({Entry(dictionary: $0)!})
        }
        
    }
    func saveToSave(){
        let entryDictionary = self.allEntry.map({$0.dictionaryCopy()})
        NSUserDefaults.standardUserDefaults().setValue(entryDictionary, forKey: "allEntry")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
//    //remove entry from array
    func removeEntry(entry:Entry) ->(){
        let index = self.allEntry.indexOf(entry)
        if let itemIndex = index {
            self.allEntry.removeAtIndex(itemIndex)
        }
    }
    
}