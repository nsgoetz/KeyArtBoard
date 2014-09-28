//
//  ItemsManager.swift
//  KeyArtBoardApp
//
//  Created by Eric on 9/28/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import Foundation

class ItemsManager {
    var items = [AsciiArtItem]()
    
    lazy private var archivePath: String = {
        let fileManager = NSFileManager.defaultManager()
        let documentsDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        let archiveURL = documentsDirectoryURLs.first!.URLByAppendingPathComponent("AsciiArtItems",isDirectory: false)
        return archiveURL.path!
        }()
    
    func save() {
        NSKeyedArchiver.archiveRootObject(items, toFile: archivePath)
        
    }
    
    private func unarchiveSavedItems() {
        if NSFileManager.defaultManager().fileExistsAtPath(archivePath) {
            let savedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as [AsciiArtItem]
            
            items = savedItems
        }
    }
    
    init() {
        unarchiveSavedItems()
    }
}
