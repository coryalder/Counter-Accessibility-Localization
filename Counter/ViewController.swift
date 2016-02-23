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
        countLabel.text = "The count is \(count)"
    }
    
}

