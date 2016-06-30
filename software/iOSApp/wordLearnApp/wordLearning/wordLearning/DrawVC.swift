//
//  ViewController.swift
//  wordLearning
//
//  Created by Martin Cimerman on 16/06/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit
import TouchDraw


class DrawVC: UIViewController, TouchDrawViewDelegate {
    
    
    var localColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    
    var selectedWord = ""
    
    @IBOutlet var colorButton: UIButton!

    @IBOutlet var drawView: TouchDrawView!
    
    @IBOutlet var foreginWordLabel: UILabel!
    
    var editor = DocumentEditor()
    
    var backgroundImagePath : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navbuttonsSetup()
        toolspaceSetup()
        wordLabelSetup()
        drawView.delegate = self
        
//        undoButton.enabled = false
//        redoButton.enabled = false
//        clearButton.enabled = false
        
        
        
//        // image save test
//        
//        var editor = DocumentEditor()
//        editor.saveImageDocumentDirectory("fluki", theImage: UIImage(named: "fluki")!)
        

        self.backgroundImagePath = self.editor.getImage(self.selectedWord)
        if self.backgroundImagePath != "" {
            drawView.backgroundColor = UIColor(patternImage: UIImage(contentsOfFile: self.backgroundImagePath!)!)
        }
        
        
    }
    
    @IBAction func penButton(sender: UIButton) {
        
        drawView.setColor(localColor)
        drawView.setWidth(CGFloat(5))
        self.colorButton.enabled = true
    }
    
    @IBAction func flukiButton(sender: UIButton) {
        drawView.setColor(localColor)
        drawView.setWidth(CGFloat(10))
        self.colorButton.enabled = true
    }
    
    @IBAction func pencilButton(sender: UIButton) {
        drawView.setColor(localColor)
        drawView.setWidth(CGFloat(0.5))
        self.colorButton.enabled = true
    }
    
    @IBAction func eraserButton(sender: UIButton) {
        drawView.setWidth(CGFloat(70))
        drawView.setColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1.0))
        self.colorButton.enabled = false
    }
    @IBAction func colorButton(sender: UIButton) {
        let r = CGFloat(random() % 255) / 255
        let g = CGFloat(random() % 255) / 255
        let b = CGFloat(random() % 255) / 255
        
        localColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        self.colorButton.backgroundColor = localColor
        drawView.setColor(localColor)
        
    }

    func wordLabelSetup(){
        
        let labelWidth = CGFloat(300)
        let labelHeight = CGFloat(60)
        
        
        self.foreginWordLabel = UILabel(frame: CGRect(x: (view.frame.width/2) - (labelWidth/2), y: labelHeight, width: labelWidth, height: labelHeight))
        self.foreginWordLabel.text = " Draw what the word \(self.selectedWord) reminds you of."
        self.foreginWordLabel.numberOfLines = 2
        self.foreginWordLabel.textAlignment = .Center
        self.foreginWordLabel.font = .systemFontOfSize(12)
        self.foreginWordLabel.textColor = UIColor.lightGrayColor()
        
        view.addSubview(foreginWordLabel)
        
    }
    
    func toolspaceSetup() {
        
        self.localColor = randomColor()
        drawView.setColor(localColor)
        drawView.setWidth(CGFloat(5))
        self.colorButton.backgroundColor = localColor
        self.colorButton.layer.cornerRadius = 10
        self.colorButton.frame.size = CGSize(width: 30, height: 30)
        
    }
    
    func randomColor() -> UIColor {
        
            let r = CGFloat(random() % 255) / 255
            let g = CGFloat(random() % 255) / 255
            let b = CGFloat(random() % 255) / 255
            return UIColor(red: r, green: g, blue: b, alpha: 1.0)

    }
    
    func navbuttonsSetup() {
        
        let doneButton = UIBarButtonItem(title: "Done", style: .Done , target: self, action: #selector(DrawVC.done))
        let undoButton = UIBarButtonItem(title: "<", style: .Done , target: self, action: #selector(DrawVC.undo))
        let redoButton = UIBarButtonItem(title: ">", style: .Done , target: self, action: #selector(DrawVC.redo))
        let clearButton = UIBarButtonItem(title: "Clear", style: .Done , target: self, action: #selector(DrawVC.clear))
        
        
        self.navigationItem.leftBarButtonItems = [doneButton, undoButton, redoButton]
        self.navigationItem.rightBarButtonItem = clearButton
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    func done(){
        
        saveDrawing()
        
        
        self.performSegueWithIdentifier("unwindToTranslatorVC", sender: self)
        // TBD fix segue
        //self.navigationController?.popViewControllerAnimated(true)
        
    }
    func undo() {
        drawView.undo()
    }
    
    func clear() {
        drawView.clearDrawing()
    }
    
    func randomColor(sender: AnyObject) {

        let r = CGFloat(random() % 255) / 255
        let g = CGFloat(random() % 255) / 255
        let b = CGFloat(random() % 255) / 255
        
        let color = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        drawView.setColor(color)
    }
    

    @IBAction func redo(sender: AnyObject) {

        drawView.redo()
    }
    
    // MARK: - TouchDrawViewDelegate
    
    func undoEnabled() {
      //  self.undoButton.enabled = true
    }
    
    func undoDisabled() {
       // self.undoButton.enabled = false
    }
    
    func redoEnabled() {
       // self.redoButton.enabled = true
    }
    
    func redoDisabled() {
       // self.redoButton.enabled = false
    }
    
    func clearEnabled() {
       // self.clearButton.enabled = true
    }
    
    func clearDisabled() {
        //self.clearButton.enabled = false
    }
    func saveDrawing(){
        
        var bottomImage : UIImage?
        
        let topImage = drawView.exportDrawing()
        
        if self.backgroundImagePath != ""{
            bottomImage = UIImage(contentsOfFile: self.backgroundImagePath!)!
        }
        else {
            bottomImage = topImage
        }
        
        let size = topImage.size // CGSize(width: 300, height: 300)
        UIGraphicsBeginImageContext(size)
        
        let areaSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        bottomImage!.drawInRect(areaSize)
        
        topImage.drawInRect(areaSize) //.drawInRect(areaSize, blendMode: kCGBlendModeNormal, alpha: 0.8)
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.editor.saveImageDocumentDirectory(self.selectedWord, theImage: newImage)
        
    }
}
