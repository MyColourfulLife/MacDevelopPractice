//
//  ViewController.swift
//  Menu
//
//  Created by Ekko on 2019/12/10.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var myMenu: NSMenu!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 上下文菜单
        view.menu = self.myMenu
    }


    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func popupClicked(_ sender: NSButton) {
        var point = sender.frame.origin
        point.x += sender.frame.width
        self.myMenu.popUp(positioning: nil, at: point, in: self.view)
    }
    
    @IBAction func menuItemClicked(_ sender: NSMenuItem) {
        print(sender.title)
    }
    
}

extension ViewController:NSMenuItemValidation {
    func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
        return menuItem.title != "Item 1"
    }
}

