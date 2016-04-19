//
//  ViewController.swift
//  Clicker
//
//  Created by Cory Alder on 2016-04-19.
//  Copyright © 2016 Cory Alder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0

    @IBOutlet var clickCountLabel: UILabel!
    
    @IBAction func increaseClickCount(sender: UIButton) {
        count += 1
        updateUI()
        
        let systemTitle1 = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
        
        let myFont = UIFont(name: "Marker Felt", size: systemTitle1.pointSize)
        
//        myLabel.font = myFont
    }
    
    func updateUI() {
        self.clickCountLabel.text = String(format: NSLocalizedString("_ clicks", comment: "the number of clicks currently displayed"), count)
    }

    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        print("asked about \(action)")
        
        switch action {
        case #selector(ViewController.copy(_:)),
             #selector(ViewController.paste(_:)):
            return true
        default:
            return false
        }
    }
    
    
    override func copy(sender: AnyObject?) {
        
        let pb = UIPasteboard.generalPasteboard()
        pb.string = "\(count)"
//        pb.setData(<#T##data: NSData##NSData#>, forPasteboardType: <#T##String#>)
    }
    
    
    override func paste(sender: AnyObject?) {
        
        let pb = UIPasteboard.generalPasteboard()
        
        if let pasteString = pb.string,
            let pastedNumber = Int(pasteString) {
            count = pastedNumber
        }
        
        updateUI()
        
    }
    
    
    @IBAction func labelTapped(sender: UITapGestureRecognizer) {
        let menuController = UIMenuController()
        
        menuController.setTargetRect(sender.view!.frame, inView: view)
        
        menuController.setMenuVisible(true, animated: true)
        
        print("tapped label")
    }
}

