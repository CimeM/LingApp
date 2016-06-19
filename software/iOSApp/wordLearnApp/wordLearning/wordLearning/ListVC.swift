//
//  ListVC.swift
//  wordLearning
//
//  Created by Martin Cimerman on 17/06/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit

class ListVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    

    
    @IBOutlet var tableView: UITableView!
    
    let userWordHistory : [String] = ["uno", "duo", "tree"]
    var selectedWordfromTable = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @IBAction func unwindToHistoryListVC(sender: UIStoryboardSegue) {
    
//        if let sourceViewController = sender.sourceViewController as? TranslatorVC, newWord = sourceViewController.selectedWord {
//        
//        
//        }
//        
//        
//        if let selectedIndexPath = tableView.indexPathForSelectedRow {
//        }
//        else{
//        
//            userWordHistory.append(newWord)
//            let newIndexPath = NSIndexPath(forRow: userWordHistory.count, inSection: 0)
//            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
//        
//        }
    
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print(" selected cell: \(indexPath.row)")
        
        self.selectedWordfromTable = userWordHistory[indexPath.row]
        
        performSegueWithIdentifier("openTranslateView", sender: self)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userWordHistory.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //var cell: UITableViewCell = (self.tableView?.dequeueReusableCellWithIdentifier("cell"))! as UITableViewCell
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = self.userWordHistory[indexPath.row]
        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "openTranslateView") {
            let vc = segue.destinationViewController as! TranslatorVC
            vc.selectedWord = self.selectedWordfromTable
            
            
            if self.selectedWordfromTable != "" {
                    vc.wordInHistoryList = true
            }
            
            self.selectedWordfromTable = ""
        }
    }
    
    
    
    
}
