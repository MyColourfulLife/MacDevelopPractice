//
//  DragDestinationView.swift
//  Drag
//
//  Created by Ekko on 2019/12/13.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class DragDestinationView: NSView {
    var imageItems:[DrawImageItem] = []
    override var isFlipped: Bool {return true}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wantsLayer = true
        layer?.borderColor = NSColor.red.cgColor
        layer?.borderWidth = 1
        registerForDraggedTypes([imagePboardType])
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        for i in 0 ..< self.imageItems.count {
            let drawImageItem:DrawImageItem = self.imageItems[i]
            let frame = NSRect(origin: drawImageItem.location!, size: CGSize(width: 16, height: 16))
            if let image = drawImageItem.image {
                image.draw(in: frame)
            }
        }
        
    }
    
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        return .generic
    }
    
    override func prepareForDragOperation(_ sender: NSDraggingInfo) -> Bool {
        return true
    }

    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        let pboard = sender.draggingPasteboard
        if let items = pboard.readObjects(forClasses: [DragImageDataItem.self], options: nil),items.count > 0 {
            let imageDataItem = items[0] as! DragImageDataItem
            let img = NSImage(data: imageDataItem.data! as Data)
            
            // 创建绘制的图像模型
            let drawImageItem = DrawImageItem()
            drawImageItem.image = img
            let point = self.convert(sender.draggingLocation, from: nil)
            drawImageItem.location = point
            
            self.imageItems.append(drawImageItem)
            needsDisplay = true
        }

        return true
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        
    }
    
    override func concludeDragOperation(_ sender: NSDraggingInfo?) {
        
    }
    
    
    
    
}

final class DrawImageItem:NSObject {
    var image:NSImage?
    var location:NSPoint?
}

final class DragImageDataItem:NSObject {
    var data:NSData?
}

extension DragImageDataItem:NSPasteboardReading {
    static func readableTypes(for pasteboard: NSPasteboard) -> [NSPasteboard.PasteboardType] {
        return [imagePboardType]
    }
    
    convenience init?(pasteboardPropertyList propertyList: Any, ofType type: NSPasteboard.PasteboardType) {
        self.init()
        data = propertyList as? NSData
    }
}
