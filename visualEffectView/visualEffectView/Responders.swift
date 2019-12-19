//
//  Responders.swift
//  visualEffectView
//
//  Created by Ekko on 2019/12/10.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class FXButton: NSButton {
    override func scrollWheel(with event: NSEvent) {
        NSLog("scrollWhell\(self)")
    }
}

class FXView: NSView {
    override func scrollWheel(with event: NSEvent) {
        NSLog("scrollWhell\(self)")
    }
    
}

class FXWindow: NSWindow {
    override func scrollWheel(with event: NSEvent) {
        NSLog("scrollWhell\(self)")
    }
}
