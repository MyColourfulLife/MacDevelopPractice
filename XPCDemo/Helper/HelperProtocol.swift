//
//  HelperProtocol.swift
//  Helper
//
//  Created by Ekko on 2019/12/17.
//  Copyright © 2019 Ekko. All rights reserved.
//
import Foundation

@objc protocol HelperProtocol {
    @objc optional func upperCaseString(aString:String?, withReply: @escaping (String?)->Void)
    @objc optional func logResultString(aString:String?)
}

