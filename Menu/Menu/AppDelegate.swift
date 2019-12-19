//
//  AppDelegate.swift
//  Menu
//
//  Created by Ekko on 2019/12/10.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var dockMenu: NSMenu!
    var statusBarItem:NSStatusItem? = nil
    var statusBarItem2:NSStatusItem? = nil
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        configStatusMenu()
        configStatusMenu2()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        NSStatusBar.system.removeStatusItem(self.statusBarItem!)
    }
    
    func applicationDockMenu(_ sender: NSApplication) -> NSMenu? {
        return self.dockMenu
    }
    
    func configStatusMenu(){
        let systembar = NSStatusBar.system
        let item = systembar.statusItem(withLength: NSStatusItem.squareLength)
        item.button?.target = self
        item.button?.action = #selector(itemAction(_:))
        item.button?.title = "T1"
        item.menu = self.dockMenu// 同时配置action和menu，menu优先
        statusBarItem = item
    }
    
    func configStatusMenu2(){
        let systembar = NSStatusBar.system
        let item = systembar.statusItem(withLength: NSStatusItem.squareLength)
        item.button?.target = self
        item.button?.action = #selector(itemPopoverAction(_:))
        item.button?.title = "T2"
        statusBarItem2 = item
    }

    @IBAction func itemAction(_ sender:AnyObject){
        NSRunningApplication.current.activate(options: NSApplication.ActivationOptions.activateIgnoringOtherApps)
        let window = NSApp.windows[0]
        window.orderFront(self)
    }
    lazy var popover:NSPopover = {
        let popover = NSPopover()
        popover.contentViewController = NSApp.windows[0].contentViewController
        return popover
    }()
    
    @IBAction func itemPopoverAction(_ sender:NSStatusBarButton){
        if self.popover.isShown {
            self.popover.close()
        }else{
            self.popover.show(relativeTo: NSZeroRect, of: sender, preferredEdge: .minY)
        }
    }
}

