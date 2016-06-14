//
//  ViewController.swift
//  LangLearnApp
//
//  Created by Martin Cimerman on 31/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: outlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: variables
    var titles : [String] = []
    var libraryItems: [String: String] = [:]
    var selectedContentID=""
    var librarian = Librarian()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // load the content to be displayed
        self.libraryItems = librarian.localLibrary.getDocumentsCredentialsfromNSU() // [String:String]
        titles = Array(libraryItems.keys)
    }

    
//    override func viewDidAppear(animated: Bool) {
//        <#code#>
//    }
//    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: Table view
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
    
        cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.detailTextLabel!.text = self.libraryItems[self.titles[indexPath.row]]
        cell.imageView?.image = UIImage(named: "SampleCoverImge")
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("title = \(titles[indexPath.row])")
        self.selectedContentID = titles[indexPath.row]
        performSegueWithIdentifier("ShowReaderVCSegue", sender: self)
        //print("You selected cell #\(indexPath.row)!")
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowReaderVCSegue"{
            if let destinationVC = segue.destinationViewController as? ReaderViewController {
                destinationVC.contentID = self.selectedContentID
            }
        }
        
    }
    
    
}

