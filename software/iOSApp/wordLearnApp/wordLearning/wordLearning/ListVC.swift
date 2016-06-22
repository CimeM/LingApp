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
    
    
    var wordList = [Word]()
    
    var selectedWordfromTable = ""
    var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //sample
        self.loadSampleWords()
        
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    
    func loadSampleWords () {
        let word1 = Word(inputWord: "uno", translatedWord: "one", fromLanguage: "", toLanguage: "", imageReference: "")!
        let word2 = Word(inputWord: "due", translatedWord: "two", fromLanguage: "", toLanguage: "", imageReference: "")!
        let word3 = Word(inputWord: "tree", translatedWord: "three", fromLanguage: "", toLanguage: "", imageReference: "")!
    
        self.wordList += [word1, word2, word3]
    }
    
    
    @IBAction func unwindToListVC(sender: UIStoryboardSegue) {
    
        
        if let sourceViewController = sender.sourceViewController as? TranslatorVC {
            
            let retrievedWord = sourceViewController.word!
            
            self.wordList.append(retrievedWord)
            
            self.tableView.reloadData()
            
        }
    }
    
    
    func saveWord() -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.selectedRow = indexPath.row
        
        performSegueWithIdentifier("openTranslateView", sender: self)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.wordList.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        let word = self.wordList[indexPath.row]
        cell.textLabel?.text = word.translatedWord
        cell.detailTextLabel?.text = "\(word.inputWord) (\(word.fromLanguage))"
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "openTranslateView") {
            let vc = segue.destinationViewController as! TranslatorVC
            
            vc.word = self.wordList[self.selectedRow]
            
            if self.selectedWordfromTable != "" {
                    vc.wordInHistoryList = true
            }
            self.selectedWordfromTable = ""
        }
    }
    
    
    
    
}
