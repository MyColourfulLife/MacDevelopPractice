//
//  SplitViewController.swift
//  SplitViewContr
//
//  Created by Ekko on 2019/12/12.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        NotificationCenter.default.addObserver(self, selector: #selector(toggleLeftView(_:)), name: .onOpenCloseView, object: nil)
    }
    
    @objc func toggleLeftView(_ notice:Notification) {
        let leftItem = splitViewItems[0]
  //方案1
//        if leftItem.isCollapsed {
//        //展开
//            expandLeftView()
//        }else {
//        //关闭
//            collapsedLeftView()
//        }
    //方案2
        leftItem.animator().isCollapsed = !leftItem.isCollapsed
    }
    
    func expandLeftView() {
        // 1.展开左边视图
        // 2.设置右边视图大小
        // 3.刷新
        let leftView = splitView.subviews[0]
        let rightView = splitView.subviews[1]
        
        let dividtorThickness = splitView.dividerThickness
        
        let leftFrame = leftView.frame
        var rightFrame = rightView.frame
        
        // 右边视图恢复到之前到大小
        rightFrame.size.width = splitView.frame.width - leftFrame.width - dividtorThickness
        rightView.frame = rightFrame
        
        leftView.isHidden = false
        splitView.display()
    }
    
    func collapsedLeftView(){
        let leftView = splitView.subviews[0]
        let rightView = splitView.subviews[1]
        leftView.isHidden = true
        rightView.frame = splitView.bounds
        splitView.display()
    }
    
    
}
