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
        contentView = ContentView(frame: view.frame)
        //contentView.frame =  view.frame
        view.addSubview(self.contentView)
    }
    
    func setup() {
        
        let leftScrollButton = UIButton()
        leftScrollButton.frame = ScrollbuttonFrame(buttonSide: .Left).frame
        leftScrollButton.addTarget(self, action: #selector(ReaderViewController.backButton), forControlEvents: .TouchUpInside)
        leftScrollButton.backgroundColor = UIColor.clearColor()
        leftScrollButton.alpha = 1
        
        view.addSubview(leftScrollButton)
        
        let rightScrollButton = UIButton()
        rightScrollButton.frame =  ScrollbuttonFrame(buttonSide: .Right).frame
        
        rightScrollButton.addTarget(self, action: #selector(ReaderViewController.forwardButton), forControlEvents: .TouchUpInside)
        rightScrollButton.backgroundColor = UIColor.clearColor()
        rightScrollButton.alpha = 1
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
