//
//  ViewController.swift
//  Redo
//
//  Created by Ekko on 2019/12/13.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController{
    @IBOutlet weak var firstAddParaTextFiled: NSTextField!
    @IBOutlet weak var scondAddParaTextFiled: NSTextField!
    @IBOutlet weak var sumTextFiled: NSTextField!
    
    var para1:NSInteger = 0
    var para2:NSInteger = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        compute(para1: 1, para2: 2)
    }

   @objc func compute(para1 fisrtPara:NSInteger, para2 secondParra:NSInteger) {
        if para1 == fisrtPara && para2 == secondParra {
            return
        }
  
        // 方法1:
    let oldValue1 = para1
    let oldValue2 = para2
    self.undoManager?.registerUndo(withTarget: self, handler: {
        [weak self](target) in
        let actionName = "\(oldValue1) + \(oldValue2)"
        target.compute(para1: oldValue1, para2: oldValue2)
        self?.undoManager?.setActionName(actionName)
    })
        
        
        // 方法2
//        if let target = self.undoManager?.prepare(withInvocationTarget: self) as? ViewController {
//            target.compute(para1: para1, para2: para2)
//            let actionName = "\(para1) + \(para2)"
//            undoManager?.setActionName(actionName)
//        }
        
        para1 = fisrtPara
        para2 = secondParra
        
        let sum = fisrtPara + secondParra
        
        firstAddParaTextFiled.integerValue = para1
        scondAddParaTextFiled.integerValue = para2
        sumTextFiled.integerValue = sum
    }
    
    @IBAction func computeAction(_ sender: NSButton) {
        let para1 = firstAddParaTextFiled.integerValue
        let para2 = scondAddParaTextFiled.integerValue
        compute(para1: para1, para2: para2)
    }
    
    @IBAction func undoAction(_ sender: NSButton) {
        undoManager?.undo()
    }
    
    @IBAction func redoAction(_ sender: NSButton) {
        undoManager?.redo()
    }
    
    
}

