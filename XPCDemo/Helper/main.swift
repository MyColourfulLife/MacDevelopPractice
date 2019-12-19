//
//  Main.swift
//  Helper
//
//  Created by Ekko on 2019/12/17.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Foundation

let delegate = ServiceDelegate()
let lisener = NSXPCListener()
lisener.delegate = delegate
lisener.resume()



