//
//  EventTestVC.swift
//  Animation
//
//  Created by Ekko on 2019/12/30.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class EventTestVC: NSViewController {
    @IBOutlet weak var topView: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        topView.wantsLayer = true
        topView.layer?.backgroundColor = NSColor.yellow.cgColor
        topView.alphaValue = 0.5
        
//        let gesture = NSClickGestureRecognizer()
//        topView.addGestureRecognizer(gesture)
        
    }
    
    @IBAction func buttonClicked(_ sender: NSButton) {
        print("啊！你敲我头！！！")
    }
    
    
    
    
}
