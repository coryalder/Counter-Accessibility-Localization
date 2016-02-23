//
//  ViewController.swift
//  Counter
//
//  Created by Cory Alder on 2016-02-23.
//  Copyright © 2016 Cory Alder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!
    
    var count = 0
    
    @IBAction func increaseCount(sender: AnyObject) {
        count++
        updateUI()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

    func updateUI() {
        
        let localized = NSLocalizedString("the count is _", comment: "showing the current count")
        countLabel.text = String(format: localized, count)
        //countLabel.text = "The count is \(count)"
    }

    
    @IBAction func viewWasTapped(sender: AnyObject) {
        
        let menuController = UIMenuController()
        
        menuController.setTargetRect(self.countLabel.frame, inView: self.view)
        
        menuController.setMenuVisible(true, animated: true)
        
    }
    
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        
        print("asked about \(action)")
        
        if action == "copy:" || action == "paste:" {
            return true
        }
        return false
    }
    
    override func copy(sender: AnyObject?) {
        
        let pb = UIPasteboard.generalPasteboard()
//        pb.string = self.countLabel.text
        pb.string = "\(count)"
        print("copied \(pb.string)")
    }
    
    override func paste(sender: AnyObject?) {
        
        let pb = UIPasteboard.generalPasteboard()
        
        if let pbString = pb.string,
            let intValue = Int(pbString) {
                count = intValue
                updateUI()
        } else {
        
        }
//        self.countLabel.text = pb.string
        
    }
}

