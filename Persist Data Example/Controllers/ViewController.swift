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
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var shouldSaveSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let shouldSave = userDefaults.object(forKey: "shouldSaveCounter") {
            if shouldSave as! Bool {
                shouldSaveSegmentedControl.selectedSegmentIndex = 0
            } else {
                shouldSaveSegmentedControl.selectedSegmentIndex = 1
                userDefaults.set(0, forKey: "counter")
            }
        }
        
        counter = userDefaults.integer(forKey: "counter")
        counterLabel.text = String(counter)
    }
    
    @IBAction func saveCounterControlValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            userDefaults.set(true, forKey: "shouldSaveCounter")
        } else {
            userDefaults.set(false, forKey: "shouldSaveCounter")
        }
    }
    
    @IBAction func addOneButtonTapped(_ sender: UIButton) {
        counter += 1
        counterLabel.text = String(counter)
        userDefaults.set(counter, forKey: "counter")
    }

}

