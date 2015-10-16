//
//  DetailEntryViewController.swift
//  Journal
//
//  Created by Joseph Hansen on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class DetailEntryViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var entryTitle: UITextField!
    @IBOutlet weak var entryText: UITextView!
    
    var entry: Entry?
    @IBAction func saveButton(sender: AnyObject) {
        //what do i replace nsdate with
        
        if let entry = self.entry{
            entry.title = self.entryTitle.text!
            entry.bodyText = self.entryText.text!
            entry.timeStamp = NSDate()
        } else{
            let newEntry = Entry(timeStamp: NSDate(), title: self.entryTitle.text!, bodyText: self.entryText.text)
            EntryController.sharedController.addEntry(newEntry)
            self.entry = newEntry
        }
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    
    @IBAction func clearButton(sender: AnyObject) {
        entryTitle.text = ""
        entryText.text = ""
        
    }
    //TODO t
    func updateWithEntry(entry: Entry){
        
        self.entry = entry
        self.entryTitle.text = entry.title
        self.entryText.text = entry.bodyText
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


