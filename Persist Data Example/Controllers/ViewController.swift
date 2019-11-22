//
//  ViewController.swift
//  Persist Data Example
//
//  Created by Artjoms Vorona on 22/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    var shouldSaveCounter = true
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var shouldSaveCounterSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        counter = userDefaults.integer(forKey: "counter")
        counterLabel.text = String(counter)
    }
    
    @IBAction func saveCounterControlValueChanged(_ sender: UISegmentedControl) {
    }
    
    @IBAction func addOneButtonTapped(_ sender: UIButton) {
        counter += 1
        counterLabel.text = String(counter)
        userDefaults.set(counter, forKey: "counter")
    }

}

