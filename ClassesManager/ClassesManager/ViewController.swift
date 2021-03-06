//
//  ViewController.swift
//  ClassesManager
//
//  Created by Ekko on 2019/12/19.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var arrayController: NSArrayController!
    @IBOutlet weak var tableView: NSTableView!
    
   @objc dynamic lazy var classesManager:ClassesManager = {
        return ClassesManager()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        try? arrayController.fetch(with: nil, merge: false)
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.classesManager.managedObjectContext.undoManager = self.undoManager
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func addAction(_ sender: NSButton) {
        let classes = NSEntityDescription.insertNewObject(forEntityName: "Classes", into: self.classesManager.managedObjectContext) as! Classes
        classes.title = "unTitled"
        classes.studentNum = 0
    }
    
    @IBAction func deleteAction(_ sender: NSButton) {
        let selectedObjects:[Classes] = self.arrayController.selectedObjects as! [Classes]
        for classObj in selectedObjects {
            self.classesManager.managedObjectContext.delete(classObj)
        }
    }
    
    @IBAction func saveAction(_ sender: NSButton) {
        self.classesManager.saveAction(sender)
    }
    
    @IBAction func queryAction(_ sender: NSSearchField) {
        let content = sender.stringValue
        if content.isEmpty {
            return
        }
        
        let predicate:NSPredicate = NSPredicate(format: content)
        self.arrayController.filterPredicate = predicate
    }
    @IBAction func uploadPhotoAction(_ sender: NSButton) {
        let index = tableView.selectedRow
        if index < 0 {
            return
        }
        openSelectClassPhotoFilePanel()
    }
    
    func openSelectClassPhotoFilePanel() {
        let arrangedObjects = arrayController.arrangedObjects as! [Classes]
        let index = tableView.selectedRow
        let classObj = arrangedObjects[index]
        
        let openDlg = NSOpenPanel()
        openDlg.canChooseFiles = true
        openDlg.canChooseDirectories = false
        openDlg.allowsMultipleSelection = false
        openDlg.allowedFileTypes = ["png"]
        openDlg.begin { (response) in
            if response == .OK {
                if let fileUrl = openDlg.urls.first,
                    let image = NSImage(contentsOf: fileUrl){
                    let imageData = NSBitmapImageRep.representationOfImageReps(in: image.representations, using: .png, properties: [:])
                    classObj.classInfo?.photo = imageData
                }
            }
        }
    }
    
}

