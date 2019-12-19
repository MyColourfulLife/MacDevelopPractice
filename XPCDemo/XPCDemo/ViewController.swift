//
//  ViewController.swift
//  XPCDemo
//
//  Created by Ekko on 2019/12/17.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    deinit {
        self.connection.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    lazy var connection:NSXPCConnection = {
        let connection = NSXPCConnection(serviceName: "xpcdemo.Helper")
        connection.remoteObjectInterface = NSXPCInterface(with: HelperProtocol.self)
        connection.exportedInterface = NSXPCInterface(with: HelperProtocol.self)
        connection.exportedObject = self
        connection.resume()
        return connection
    }()

    @IBAction func convertAction(_ sender: NSButton) {
        let helper = self.connection.remoteObjectProxyWithErrorHandler { (error) in
            print("remote proxy error:\(error)")
        } as? HelperProtocol
        
        let testString = "hello world!"
        helper?.upperCaseString?(aString: testString, withReply: { (content) in
            print("the upper reuslt:\(content)")
        })
    }
    
}

extension ViewController:HelperProtocol {
    func logResultString(aString: String?) {
        print("callback result:\(aString)")
    }
}

