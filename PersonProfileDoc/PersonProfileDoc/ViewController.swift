//
//  ViewController.swift
//  PersonProfileDoc
//
//  Created by Ekko on 2019/12/17.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @objc dynamic var profile:PersonProfile?
    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profile = PersonProfile()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func clickAction(_ sender: NSClickGestureRecognizer) {
        openPanel()
    }
    
    func openPanel()  {
        let openDlg = NSOpenPanel()
        openDlg.canChooseFiles = true
        openDlg.canChooseDirectories = false
        openDlg.allowsMultipleSelection = false
        openDlg.allowedFileTypes = ["png","gpeg"]
        openDlg.begin { (result) in
            if result == .OK {
                if let fileURL = openDlg.urls.first, let image = NSImage(contentsOf: fileURL) {
                    self.imageView.image = image
                    self.profile?.image = image
                }
            }
        }
    }
    
}

