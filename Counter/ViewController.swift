//
//  ViewController.swift
//  Counter
//
//  Created by Cory Alder on 2015-12-01.
//  Copyright © 2015 Cory Alder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var visitCount = 0
    
    @IBOutlet var visitCountLabel: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let name = NSUserDefaults.standardUserDefaults().valueForKey("name_preference")
            
            
        print("name is \(name)")
        
        self.updateUI()
    }
    
    
    
    
    @IBAction func incrementVisitCount(sender: AnyObject) {
        
        visitCount++
        
        self.updateUI()
        
    }
    
    func updateUI() {
        self.visitCountLabel.text = String(format: NSLocalizedString("visitor_count_string", comment: "visitor count"), visitCount)
        //self.visitCountLabel.text = "You are visitor \(visitCount)"
    }
    
    

    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        
        print("asked about \(action)")
        
        
        return self.respondsToSelector(action)
//        
//        if (action == "cut:") {
//            return false
//        }
//        
//        return true
        
    }
    
    override func copy(sender: AnyObject?) {
        
        print("copy text")
        
        UIPasteboard.generalPasteboard().string = "I copied this"
    }
    
    override func paste(sender: AnyObject?) {
        print("paste: \(UIPasteboard.generalPasteboard().string)")
    }
    
    @IBAction func copyButtonAction(sender: UIView) {
        
        
//        UIPasteboard.generalPasteboard().string = "I copied this"
//        return
        
        
        let menuController = UIMenuController.sharedMenuController()
        
        menuController.setTargetRect(sender.frame, inView: self.view)
        
        menuController.setMenuVisible(true, animated: true)
    }

}

