//
//  TrackView.swift
//  Event
//
//  Created by Ekko on 2019/12/13.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class TrackView: NSView {
    var tracking = false
    
    // 初始化代码放在awakeNib
    override func awakeFromNib() {
        super.awakeFromNib()
        wantsLayer = true
        // 设置跟踪区域
        let eyeBox = CGRect(x: 0, y: 0, width: 40, height: 40)
        let trackArea = NSTrackingArea(rect: eyeBox, options: [.mouseMoved,.mouseEnteredAndExited,.activeInKeyWindow,.cursorUpdate], owner: self, userInfo: nil)
        addTrackingArea(trackArea)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        if tracking {
            layer?.borderWidth = 10
            layer?.borderColor = NSColor.red.cgColor
        }else {
            layer?.borderWidth = 1
            layer?.borderColor = NSColor.gray.cgColor
        }
        
    }
    
    override func mouseEntered(with event: NSEvent) {
        tracking = true
        needsDisplay = true
    }
    
    override func mouseMoved(with event: NSEvent) {
        // 鼠标在跟踪区域内移动
    }
    
    override func mouseExited(with event: NSEvent) {
        tracking = false
        needsDisplay = true
    }
    
    // 更新光标
    override func cursorUpdate(with event: NSEvent) {
        if tracking {
            NSCursor.crosshair.set()
        }else {
            NSCursor.arrow.set()
        }
    }
    
}
