//
//  ViewController.swift
//  Journal
//
//  Created by Caleb Hicks on 9/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedController.allEntry.count
    }
    //dequeue table cells
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath:indexPath)
        //TODO
        let entry = EntryController.sharedController.allEntry[indexPath.row]
        cell.textLabel?.text = entry.title
        return cell
        
    }
//TODO commit editing style
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
        let entry = EntryController.sharedController.allEntry[indexPath.row]
            EntryController.sharedController.removeEntry(entry)
            
            //delete from the table
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:.Fade)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toEntryDetail" {
            if let detailViewController = segue.destinationViewController as? DetailEntryViewController {
                    _=detailViewController.view
                    let indexPath = tableView.indexPathForSelectedRow
                    if let selectedRow = indexPath?.row{
                        let entry = EntryController.sharedController.allEntry[selectedRow]
                        detailViewController.updateWithEntry(entry)
                        
                        }
                    }
            }
        }
    }




