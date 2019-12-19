//
//  DragFileViewController.swift
//  Drag
//
//  Created by Ekko on 2019/12/13.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class DragFileViewController: NSViewController {
    @IBOutlet var textView: NSTextView!
    @IBOutlet var dragView: FileDragView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        dragView.delegate = self
    }
    
}

extension DragFileViewController:FileDragDelegate {
    func didFinishDrag(_ fileURL: NSURL) {
        do {
            let string = try String.init(contentsOf: fileURL as URL, encoding: .utf8)
            self.textView.string = string
        } catch  {
            print(error)
        }
    }
}
