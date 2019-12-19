//
//  WindowBorderless.swift
//  WindowLogin
//
//  Created by Ekko on 2019/12/12.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class WindowBorderless: NSWindow {
    // 无titlebar的window默认不接受键盘事件
    // 通过重写此方法，让其接受键盘事件
    override var canBecomeKey: Bool {
        return true
    }
    // 没有titlebar没有地方拖动窗口，设置点击背景可以拖动
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        self.isMovableByWindowBackground = true
    }

}
