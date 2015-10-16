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
    @IBAction func saveButton(sender: AnyObject) {
        //what do i replace nsdate with
        
        let entry = Entry(timeStamp: NSDate(), title: entryTitle.text!, bodyText: entryText.text!)
        EntryController.sharedController.addEntry(entry)
        
    }
    
    @IBAction func clearButton(sender: AnyObject) {
        entryTitle.text = ""
        entryText.text = ""
        
    }
    //TODO t
    func updateWithEntry(entry: Entry){
        title = entry.title
        
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


