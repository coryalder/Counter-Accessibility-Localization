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
    }
    
    func updateUI() {
        self.clickCountLabel.text = "\(count) Clicks"
    }

}

