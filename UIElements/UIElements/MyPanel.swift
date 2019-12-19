//
//  MyPanel.swift
//  UIElements
//
//  Created by Ekko on 2019/12/10.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class MyPanel: NSPanel {
    @IBAction func cancelAction(_ sender: NSButton) {
        parent?.endSheet(self, returnCode: NSApplication.ModalResponse.cancel)
    }
    
    @IBAction func okAction(_ sender: NSButton) {
        parent?.endSheet(self, returnCode: NSApplication.ModalResponse.OK)
    }
    
}
