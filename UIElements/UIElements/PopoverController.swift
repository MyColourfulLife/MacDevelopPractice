//
//  PopoverController.swift
//  UIElements
//
//  Created by Ekko on 2019/12/10.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class PopoverController: NSViewController {

    lazy var sharePopover:NSPopover = {
        let popover = NSPopover()
        let controller =  self.storyboard?.instantiateController(withIdentifier: "Share") as! NSViewController
        popover.contentViewController = controller
        popover.behavior = .transient
        return popover
    }()
    
    lazy var feedbackPopover:NSPopover = {
         let popover = NSPopover()
         let controller =  self.storyboard?.instantiateController(withIdentifier: "Feedback") as! NSViewController
         popover.contentViewController = controller
         popover.behavior = .semitransient
         return popover
     }()
    var topLevelArray:NSArray?
    lazy var myPanel:MyPanel? = {
        var panel:MyPanel?
        let nib = NSNib.init(nibNamed: "myPanel", bundle: Bundle.main)
        if let success = nib?.instantiate(withOwner: self, topLevelObjects: &topLevelArray), success {
            for obj in self.topLevelArray! {
                if obj is MyPanel {
                    panel = obj as? MyPanel
                    break
                }
            }
        }
        return panel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func sharePopover(_ sender: NSButton) {
        sharePopover.show(relativeTo: sender.bounds, of: sender, preferredEdge: .maxX)
    }
    
    @IBAction func feedbackPopover(_ sender: NSButton) {
        feedbackPopover.show(relativeTo: sender.bounds, of: sender, preferredEdge: .minY)
    }
    
    @IBAction func showPanel(_ sender: NSButton) {
        self.myPanel?.parent = self.view.window
        self.myPanel?.title = "My Panel"
        self.view.window?.beginSheet(self.myPanel!, completionHandler: { (returncode) in
            print(returncode)
        })
    }
    
    
}
