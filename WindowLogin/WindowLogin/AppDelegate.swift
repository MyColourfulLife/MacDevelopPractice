//
//  AppDelegate.swift
//  WindowLogin
//
//  Created by Ekko on 2019/12/12.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var mainWindowController:MainWindowController? = {
      let mainWindowCtr =  NSStoryboard.main?.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("MainWindowController")) as! MainWindowController
        return mainWindowCtr
    }()
    
    lazy var loginWindowController:LoginWindowController? = {
      let mainWindowCtr =  NSStoryboard.main?.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("LoginWindowController")) as! LoginWindowController
        return mainWindowCtr
    }()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        self.loginWindowController?.showWindow(self)
        registerNotification()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        mainWindowController = nil
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(onLoginOK(_:)), name: .loginOK, object: nil)
    }

    @objc func onLoginOK(_ notice:Notification) {
        self.mainWindowController?.showWindow(self)
    }

}

