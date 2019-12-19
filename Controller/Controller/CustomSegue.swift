//
//  CustomSegue.swift
//  Controller
//
//  Created by Ekko on 2019/12/12.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class CustomSegue: NSStoryboardSegue {
    override func perform() {
        let animator = PresentCustomAnimator()
        (sourceController as? NSViewController)?.present((destinationController as? NSViewController)!, animator: animator)
    }
}
