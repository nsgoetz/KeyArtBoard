//
//  AsciiArtItem.swift
//  KeyArtBoardApp
//
//  Created by Eric on 9/28/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

class AsciiArtItem: NSObject, NSCoding {
    
    private struct SerializationKeys {
        static let name = "name"
        static let ascii = "ascii"
    }
    
    let name: String
    var ascii: String?
    var isComplete: Bool {
        get {
            return ascii != nil
        }
    }
    init(name: String) {
        self.name = name
    }
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(name, forKey: SerializationKeys.name)
        if let theAscii = ascii {
            coder.encodeObject(theAscii, forKey: SerializationKeys.ascii)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(SerializationKeys.name) as String
        ascii = aDecoder.decodeObjectForKey(SerializationKeys.ascii) as? String
    }
}
