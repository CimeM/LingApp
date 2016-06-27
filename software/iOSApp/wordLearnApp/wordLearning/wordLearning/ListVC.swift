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
    @IBOutlet var newButton: UIBarButtonItem!
    
    var wordList = [Word]()
    
    var selectedWordfromTable = ""
    var selectedRow = 0
    
    var librarian = NSUSerDefaultsComunication()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //sample
        //self.loadSampleWords()
        
        self.loadSavedWords()
        
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        
        
    }
    
    
    func loadSavedWords(){
        
        self.wordList = self.librarian.loadWordList()
        
    }
    
    func saveWords(){
        
        self.librarian.saveWordList(self.wordList)
        
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
            
            self.saveWords() //to nsUserDefaults
            
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
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            wordList.removeAtIndex(indexPath.row)
            self.saveWords()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        else if editingStyle == .Insert {
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "openTranslateView") {
            
            let vc = segue.destinationViewController as! TranslatorVC
            
            
            if sender !== newButton {
                vc.word = self.wordList[self.selectedRow]
                vc.wordInHistoryList = true
            }
            
        }
    }
    
    
    
    
}
