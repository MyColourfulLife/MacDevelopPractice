//
//  ViewController.swift
//  KVBEmployee
//
//  Created by Ekko on 2019/12/16.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @objc dynamic var employee: Employee?
    @IBOutlet var objectController: NSObjectController!
    
//    deinit {
//        objectController.unbind(NSBindingName.init("content"))
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 使用代码进行绑定
//        objectController.bind(NSBindingName.init("content"), to: self, withKeyPath: "employee", options: nil)
        
        let em = Employee()
        em.id = 123123123
        em.name = "John"
        em.address = "China BeiJing"
        em.age = 25
        self.employee = em
    }


    @IBAction func okButtonAction(_ sender: NSButton) {
        print(employee)
    }
    

}

