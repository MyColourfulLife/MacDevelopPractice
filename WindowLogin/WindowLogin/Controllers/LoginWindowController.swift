//
//  LoginWindowController.swift
//  WindowLogin
//
//  Created by Ekko on 2019/12/12.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class LoginWindowController: NSWindowController,NSWindowDelegate {

    deinit {
        print("Login window deinit")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    func windowWillClose(_ notification: Notification) {
        // 释放控制器强引用的window和contentViewController
        window = nil
        contentViewController = nil
    }

}
