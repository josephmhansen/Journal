//
//  Entry.swift
//  Journal
//
//  Created by Joseph Hansen on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
class Entry: Equatable {
    private let timeKey = "timeStamp"
    private let titleKey = "title"
    private let bodyKey = "bodyText"
    
    var timeStamp: NSDate
    var title: String
    var bodyText: String
    
    init(timeStamp:NSDate = NSDate(), title:String, bodyText:String){
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }
    init?(dictionary:[String:AnyObject]){
        guard let title = dictionary[self.titleKey] as? String,
        timeStamp = dictionary[self.timeKey] as? NSDate,
        bodyText = dictionary[self.bodyKey] as? String
            else{
                self.title = ""
                self.timeStamp = NSDate()
                self.bodyText = ""
                
                return nil
                }
        self.title = title
        self.timeStamp = timeStamp
        self.bodyText = bodyText
        
        
    }
    func dictionaryCopy() -> [String:AnyObject]{
        let dictionary: [String:AnyObject] = [
            self.titleKey: title,
            self.timeKey: timeStamp,
            self.bodyKey: bodyText
        ]
        return dictionary
    }
    
}

//TODO: object identifier?
func ==(lhs:Entry, rhs:Entry) ->Bool{
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)

    
}