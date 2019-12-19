//
//  ListViewController.swift
//  KVBEmployee
//
//  Created by Ekko on 2019/12/16.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ListViewController: NSViewController {
    @objc dynamic var employees:[Employee] = []
    @IBOutlet var arrayController: NSArrayController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        arrayController.bind(NSBindingName.init(rawValue: "contentArray"), to: self, withKeyPath: "employees", options: [NSBindingOption.allowsEditingMultipleValuesSelection:true])
        configData()
    }
    
    func configData(){
        let em1 = Employee()
        em1.id = 1
        em1.name = "mark"
        em1.address = "beijing"
        em1.age = 10
        
        let em2 = Employee()
        em2.id = 2
        em2.name = "john"
        em2.address = "hongkang"
        em2.age = 20
        
        employees = [em1,em2]
    }
}
