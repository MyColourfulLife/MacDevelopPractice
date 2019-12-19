//
//  Document.swift
//  PersonProfileDoc
//
//  Created by Ekko on 2019/12/17.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    @objc dynamic var profile:PersonProfile?
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
        
        profile = PersonProfile()
        profile?.image = NSImage(named: "NSEveryone")
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
        
        let document = windowController.document as! Document
        let viewController = windowController.contentViewController as! ViewController
        
        viewController.bind(NSBindingName(rawValue: "profile"), to: document, withKeyPath: "profile", options: nil)
        
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override fileWrapper(ofType:), write(to:ofType:), or write(to:ofType:for:originalContentsURL:) instead.
        return (self.profile?.docData())!
    }

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override read(from:ofType:) instead.
        // If you do, you should also override isEntireFileLoaded to return false if the contents are lazily loaded.
        self.profile = PersonProfile.profileFrom(data)
    }
    
    override func write(to url: URL, ofType typeName: String) throws {
        if typeName == "com.ekko.pdata" {
            return try! super.write(to: url, ofType: typeName)
        }
    }


}

