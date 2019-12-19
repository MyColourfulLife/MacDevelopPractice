//
//  TreeViewController.swift
//  KVBEmployee
//
//  Created by Ekko on 2019/12/16.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class TreeViewController: NSViewController {

    @IBOutlet var treeController: TreeController!
    @objc dynamic var treeNodes:[NSMutableDictionary] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let root = treeController.newObject() as! NSMutableDictionary
        treeNodes.append(root)
    }
    
}

class TreeController: NSTreeController {
    override func newObject() -> Any {
        let node = NSMutableDictionary()
        node["name"] = "Group"
        let children = NSMutableArray()
        node["children"] = children
        let m1 = NSMutableDictionary()
        m1["name"] = "m1"
        children.add(m1)
        let m2 = NSMutableDictionary()
        m2["name"] = "m2"
        children.add(m2)
        return node
    }
}
