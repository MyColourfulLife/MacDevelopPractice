//
//  ServiceProvider.swift
//  Services
//
//  Created by Ekko on 2019/12/17.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ServiceProvider: NSObject {
    func upperCaseText(_ pboard:NSPasteboard, userData:String!, error:AutoreleasingUnsafeMutablePointer<String>) {
        guard let containString = pboard.types?.contains(.string), containString else {
            error.pointee = NSLocalizedString("Error:couldn't convert text.", comment: "pboard couldn't upercase string.")
            return
        }
        
        guard let pboardString = pboard.string(forType: .string),
            let uppserCaseString = convertToUpperCase(pboardString) else {
            error.pointee = NSLocalizedString("Error:couldn't convert text.", comment: "pboard couldn't upercase string.")
            return
        }
            pboard.clearContents()
            pboard.writeObjects([uppserCaseString as NSString])
    }
    
    func convertToUpperCase(_ string:String)->String? {
        return string.isEmpty ? nil : string.uppercased()
    }
}
