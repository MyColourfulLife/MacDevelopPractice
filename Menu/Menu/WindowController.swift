//
//  WindowController.swift
//  Menu
//
//  Created by Ekko on 2019/12/10.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    @IBOutlet weak var toolBar: NSToolbar!
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    @IBAction func toolbarItemClicked(_ sender: NSToolbarItem) {
        print(sender.tag)
        let panel = NSOpenPanel()
        panel.begin { (response) in
            print(response)
        }
    }
    

    
}

