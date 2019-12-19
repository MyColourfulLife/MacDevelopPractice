//
//  CollectionViewController.swift
//  UIElements
//
//  Created by Ekko on 2019/12/10.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class CollectionViewController: NSViewController {
    
    @IBOutlet weak var collectionView: NSCollectionView!
    var content = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置cell原型
        collectionView.itemPrototype = storyboard?.instantiateController(withIdentifier: "collectionViewItem") as? NSCollectionViewItem
        updateContents()
    }
    
    func updateContents(){
        let item1:NSDictionary = ["title":"Computer1","image":NSImage(named: "NSComputer")]
        let item2:NSDictionary = ["title":"Computer2","image":NSImage(named: "NSComputer")]
        let item3:NSDictionary = ["title":"Computer3","image":NSImage(named: "NSComputer")]
        let item4:NSDictionary = ["title":"Computer4","image":NSImage(named: "NSComputer")]
        let item5:NSDictionary = ["title":"Computer5","image":NSImage(named: "NSComputer")]
        let item6:NSDictionary = ["title":"Computer6","image":NSImage(named: "NSComputer")]
        content.append(item1)
        content.append(item2)
        content.append(item3)
        content.append(item4)
        content.append(item5)
        content.append(item6)
        collectionView.content = content
    }
}
