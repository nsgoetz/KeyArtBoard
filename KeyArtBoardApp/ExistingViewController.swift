//
//  TableViewController.swift
//  KeyArtBoardApp
//
//  Created by Eric on 9/27/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

class ListViewController : UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // var itemsList = [ScavengerHuntItem]()
    
    let itemsManager = ItemsManager()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsManager.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell") as UITableViewCell
        let item = itemsManager.items[indexPath.row]
        cell.textLabel!.text = item.name
        
        if (item.isComplete) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
            cell.imageView?.image = nil
        }
        return cell
    }
    
    @IBAction func tableView() {
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    

}
