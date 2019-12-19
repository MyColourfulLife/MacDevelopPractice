//
//  ServiceDelegate.swift
//  Helper
//
//  Created by Ekko on 2019/12/17.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ServiceDelegate: NSObject,NSXPCListenerDelegate {
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        newConnection.exportedInterface = NSXPCInterface(with: HelperProtocol.self)
        let helper = Helper()
        newConnection.exportedObject = helper
        
        newConnection.remoteObjectInterface = NSXPCInterface(with: HelperProtocol.self)
        helper.connection = newConnection
        
        newConnection.resume()
        return true
    }
}
