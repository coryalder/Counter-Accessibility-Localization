//
//  ViewController.swift
//  Counter
//
//  Created by Cory Alder on 2015-10-13.
//  Copyright © 2015 Cory Alder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!
    
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func incrementCount(sender: AnyObject) {
        
        count++

        
        countLabel.text = String(format: NSLocalizedString("visitor_counter_label", comment: "tell user about how many visitors there have been"), count)
//        countLabel.text = "You are visitor number \(count)"
        
    }
    
    
    @IBAction func copyCount(sender: AnyObject) {
        
        
        let menu = UIMenuController.sharedMenuController()
        
        menu.setTargetRect(sender.frame, inView: view)
        
        menu.setMenuVisible(true, animated: true)
        
        
    }
    
    override func copy(sender: AnyObject?) {
        
        UIPasteboard.generalPasteboard().string = "count is \(count)"
        
    }

    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        
//        return true
//        return action == "copy:"
        return self.respondsToSelector(action)
        
    }
}

