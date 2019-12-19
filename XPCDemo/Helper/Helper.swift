//
//  Helper.swift
//  Helper
//
//  Created by Ekko on 2019/12/17.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class Helper: NSObject {
    var connection:NSXPCConnection?
    
}

extension Helper:HelperProtocol {
    func upperCaseString(aString:String?, withReply: @escaping (String?)->Void) {
        let upperString = aString?.uppercased()
        withReply(upperString)
    
        let callback = self.connection?.remoteObjectProxyWithErrorHandler({ (error) in
            print("remote proxy error:\(error)")
        }) as? HelperProtocol
        callback?.logResultString?(aString: upperString)
    }
}
