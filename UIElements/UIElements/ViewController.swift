//
//  ViewController.swift
//  UIElements
//
//  Created by Ekko on 2019/12/10.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var splitView: NSSplitView!
    
    var leftViewWidth:CGFloat = 0
    @IBAction func tongglezPannel(_ sender: NSButton) {
        // 获取左边试图
        let leftView = splitView.arrangedSubviews[0]
        if splitView.isSubviewCollapsed(leftView) {
            //展开
            splitView.setPosition(leftViewWidth, ofDividerAt: 0)
            leftView.isHidden = false
        }else {
            //关闭
            splitView.setPosition(0, ofDividerAt: 0)
            leftView.isHidden = true
            leftViewWidth = leftView.frame.size.width
        }
        
        splitView.adjustSubviews()
    }
    

}

extension ViewController:NSSplitViewDelegate {
    func splitView(_ splitView: NSSplitView, canCollapseSubview subview: NSView) -> Bool {
        return subview == splitView.subviews[0]
    }
    
    func splitView(_ splitView: NSSplitView, constrainMinCoordinate proposedMinimumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return 50
    }
    
//    func splitView(_ splitView: NSSplitView, constrainMaxCoordinate proposedMaximumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
//        return 100
//    }
    
    func splitView(_ splitView: NSSplitView, shouldAdjustSizeOfSubview view: NSView) -> Bool {
        return true
    }
    
    func splitView(_ splitView: NSSplitView, shouldHideDividerAt dividerIndex: Int) -> Bool {
        return true
    }
    
}

