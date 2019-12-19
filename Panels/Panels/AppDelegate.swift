//
//  AppDelegate.swift
//  Panels
//
//  Created by Ekko on 2019/12/10.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var loginPanel: NSPanel!
    
    @IBOutlet weak var window: NSWindow!

    @IBAction func loginButtonAction(_ sender: NSButton) {
        self.window.beginSheet(self.loginPanel) { (returnCode) in
            print("return code:\(returnCode)")
        }
    }
    @IBAction func okButtonAction(_ sender: NSButton) {
        self.window.endSheet(self.loginPanel)
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

