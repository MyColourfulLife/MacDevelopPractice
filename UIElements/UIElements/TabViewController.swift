//
//  TabViewController.swift
//  UIElements
//
//  Created by Ekko on 2019/12/10.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class TabViewController: NSViewController {
    @IBOutlet weak var tabView: NSTabView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    @IBAction func segmentAction(_ sender: NSSegmentedControl) {
        tabView.selectTabViewItem(at: sender.selectedSegment)
    }
    
}
