//
//  ViewController.swift
//  Drag
//
//  Created by Ekko on 2019/12/13.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var sourceView: DragSourceView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.sourceView.dragSourceViewDelegate = self
    }

}

extension ViewController:NSDraggingSource {
    func draggingSession(_ session: NSDraggingSession, sourceOperationMaskFor context: NSDraggingContext) -> NSDragOperation {
        return .generic
    }
    
    //开始拖放
//    func draggingSession(_ session: NSDraggingSession, willBeginAt screenPoint: NSPoint) {
//
//    }
//
//    func draggingSession(_ session: NSDraggingSession, movedTo screenPoint: NSPoint) {
//
//    }
//
//    func draggingSession(_ session: NSDraggingSession, endedAt screenPoint: NSPoint, operation: NSDragOperation) {
//
//    }
    
    
}

