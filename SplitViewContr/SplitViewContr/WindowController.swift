//
//  WindowController.swift
//  SplitViewContr
//
//  Created by Ekko on 2019/12/12.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    @IBAction func openCloseAction(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name.onOpenCloseView, object: nil)
    }
    
}

extension Notification.Name {
    static let onOpenCloseView = Notification.Name.init("onOpenCloseView")
}
