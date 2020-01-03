//
//  ViewController.swift
//  FrameWorkTest
//
//  Created by Ekko on 2020/1/2.
//  Copyright © 2020 Ekko. All rights reserved.
//

import Cocoa
import Easy

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(LocalizeManager.shared.currentLanguage)
        view.setBgColor(NSColor.cyan)
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

