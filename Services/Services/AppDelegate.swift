//
//  AppDelegate.swift
//  Services
//
//  Created by Ekko on 2019/12/17.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let s = ServiceProvider()
        NSApp.servicesProvider = s
        NSUpdateDynamicServices()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

