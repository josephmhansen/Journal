//
//  Entry.swift
//  Journal
//
//  Created by Joseph Hansen on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
class Entry: Equatable {
    let timeStamp: NSDate
    let title: String
    let bodyText: String
    
    init(timeStamp:NSDate, title:String, bodyText:String){
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }

}

//TODO object identifier?
func ==(lhs:Entry, rhs:Entry) ->Bool{
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)

    
}