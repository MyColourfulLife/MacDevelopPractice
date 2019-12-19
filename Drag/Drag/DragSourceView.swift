//
//  DragSourceView.swift
//  Drag
//
//  Created by Ekko on 2019/12/13.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

public let kImagePboardTypeName = "macdev.io.imageDrag"
let imagePboardType = NSPasteboard.PasteboardType(rawValue: kImagePboardTypeName)

class DragSourceView: NSImageView {
    weak var dragSourceViewDelegate:NSDraggingSource?

    
    override func mouseDown(with event: NSEvent) {
        // pasteitem
        let pastBoardItem = NSPasteboardItem()
        pastBoardItem.setDataProvider(self, forTypes: [imagePboardType])
        
        // dargitem
        let draggingItem = NSDraggingItem(pasteboardWriter: pastBoardItem)
        draggingItem.draggingFrame = NSRect(x: 0, y: 0, width: 16, height: 16)
        
        // 拖放可视化图像设置
        draggingItem.imageComponentsProvider = {
            let component = NSDraggingImageComponent(key: NSDraggingItem.ImageComponentKey.icon)
            component.frame = NSRect(x: 0, y: 0, width: 16, height: 16)
            component.contents = NSImage(size: NSSize(width: 32, height: 32), flipped: false, drawingHandler: { [unowned self](rect) -> Bool in
                self.image?.draw(in: rect)
                return true
            })
            
            return [component]
        }
        
        // 启动拖放会话
        beginDraggingSession(with: [draggingItem], event: event, source: dragSourceViewDelegate!)
    }
    
    
}

extension DragSourceView:NSPasteboardItemDataProvider {
    func pasteboard(_ pasteboard: NSPasteboard?, item: NSPasteboardItem, provideDataForType type: NSPasteboard.PasteboardType) {
        let data = image?.tiffRepresentation
        item.setData(data!, forType: type)
    }
}
