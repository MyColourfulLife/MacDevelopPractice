//
//  ViewController.swift
//  visualEffectView
//
//  Created by Ekko on 2019/12/10.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var scrollView: NSClipView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.wantsLayer = true
//        view.layer?.backgroundColor = NSColor.red.cgColor
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func scrollAction(_ sender: NSButton) {
        var frame = scrollView.bounds
        frame.origin.y += 10
        scrollView.bounds = frame
    }
    

}

