//
//  DragView.swift
//  Event
//
//  Created by Ekko on 2019/12/13.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class DragView: NSView {
    var draged:Bool = false// 拖放进行的标记
    var centerBox:NSRect? // 中心附近的矩形frame

    override func awakeFromNib() {
        super.awakeFromNib()
        centerBox = self.bounds.insetBy(dx: 10, dy: 10)
    }
    // 拖放时蓝色 结束时绿色
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        let color = draged ? NSColor.blue : NSColor.green
        color.setFill()
        dirtyRect.fill()
    }
    
    // 判断是否满足拖放条件
    override func mouseDown(with event: NSEvent) {
        let eventLocation = event.locationInWindow
        let pointInView = convert(eventLocation, from: nil)
        if NSPointInRect(pointInView, centerBox!) {
            draged = true
        }
    }
    
    override func mouseDragged(with event: NSEvent) {
        if draged {
            // 设置frame，并进行重新绘制
            let eventLocation = event.locationInWindow
            let positionBox = NSRect(x: eventLocation.x, y: eventLocation.y, width: frame.width, height: frame.height)
            frame = positionBox
            needsDisplay = true
        }
    }
    
    override func mouseUp(with event: NSEvent) {
        draged = false
        needsDisplay = true
    }
    
}
