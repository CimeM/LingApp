//
//  ReaderViewController.swift
//  LangLearnApp
//
//  Created by Martin Cimerman on 11/06/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit

class ReaderViewController: UIViewController {

    
    @IBOutlet var contentView: ContentView!;
    @IBOutlet var progressBar: ProgressBarView!;
    
    var screenHeight = CGFloat(0)
    var screenWidth = CGFloat(0)
    var contentID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.title = self.contentID
        
        //contentView.contentID = self.contentID
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let progressfieldHeight = CGFloat(40)
        contentView = ContentView(frame: CGRect(x: view.frame.origin.x,
            y: view.frame.origin.y,
            width: view.frame.width, height: view.frame.height - progressfieldHeight))
        contentView.backgroundColor = UIColor.whiteColor()
        
        progressBar = ProgressBarView()
        progressBar.frame = CGRect(x: view.frame.origin.x,
                                   y: view.frame.height - progressfieldHeight,
                                   width: view.frame.width,
                                   height: progressfieldHeight)
        progressBar.backgroundColor = UIColor.clearColor()
        progressBar.status(15, all: 20)
        view.addSubview(self.progressBar)
        view.addSubview(self.contentView)
    }
    
    func setup() {
        
        let leftScrollButton = UIButton()
        leftScrollButton.frame = ScrollbuttonFrame(buttonSide: .Left).frame
        leftScrollButton.addTarget(self, action: #selector(ReaderViewController.backButton), forControlEvents: .TouchUpInside)
        leftScrollButton.backgroundColor = UIColor.lightGrayColor()
        leftScrollButton.alpha = 0.5
        
        view.addSubview(leftScrollButton)
        
        let rightScrollButton = UIButton()
        rightScrollButton.frame =  ScrollbuttonFrame(buttonSide: .Right).frame
        
        rightScrollButton.addTarget(self, action: #selector(ReaderViewController.forwardButton), forControlEvents: .TouchUpInside)
        rightScrollButton.backgroundColor = UIColor.darkGrayColor()
        rightScrollButton.alpha = 0.5
        view.addSubview(rightScrollButton)
        
        
        
        
    }
    
    @IBAction func backButton(sender: UIButton) {}
    @IBAction func forwardButton(sender: UIButton) {}
    
    struct ScrollbuttonFrame {
        
        var verticalMargin = CGFloat(100)
        var xPos : CGFloat = 0
        var buttonWidth =  CGFloat(100)
        var buttonHeigth = CGFloat(100)
        var frame : CGRect
        
        enum ButtonSide {
            case Left
            case Right
        }
        
        init (buttonSide: ButtonSide) {
            
            buttonWidth =  UIScreen.mainScreen().bounds.width/7
            
            switch buttonSide {
            case .Left:
                self.xPos = 0
            case .Right:
                self.xPos = UIScreen.mainScreen().bounds.width - buttonWidth
                
            }
            
            buttonHeigth = UIScreen.mainScreen().bounds.height - (2*verticalMargin)
            
            frame = CGRect(x: xPos, y: verticalMargin, width: buttonWidth, height: buttonHeigth)
            
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

}
