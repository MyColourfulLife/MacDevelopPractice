//
//  FileDragView.swift
//  Drag
//
//  Created by Ekko on 2019/12/13.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

protocol FileDragDelegate:class {
    func didFinishDrag(_ fileURL:NSURL)
}


class FileDragView: NSView {
    weak var delegate:FileDragDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 注册拖放类型
        registerForDraggedTypes([.fileURL])
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        let sourceDargMask = sender.draggingSourceOperationMask
        let pboard = sender.draggingPasteboard
        let dragTypes = pboard.types!
        if dragTypes.contains(.fileURL) {
            if sourceDargMask.contains(NSDragOperation.link) {
                return .link
            }
            
            if sourceDargMask.contains(.copy) {
                return .copy
            }
        }
        return .generic
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        let pboard = sender.draggingPasteboard
        let dragTypes = pboard.types!
        if dragTypes.contains(.fileURL) {
            let files = pboard.readObjects(forClasses: [NSURL.self], options: nil) as! [NSURL]
            for fileURL in files {
                print("fileURL:\(fileURL)\n,filePath:\(fileURL.path!)")
            }
            delegate?.didFinishDrag(files[0])
        }
        return true
    }
    
    
}


