//
//  PresentCustomAnimator.swift
//  Controller
//
//  Created by Ekko on 2019/12/12.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class PresentCustomAnimator: NSObject,NSViewControllerPresentationAnimator {
    func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController) {
        viewController.view.wantsLayer = true
        viewController.view.alphaValue = 0
        
        fromViewController.view.addSubview(viewController.view)
        viewController.view.layer?.backgroundColor = NSColor.gray.cgColor
        // 增加约束
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        let width = viewController.view.widthAnchor.constraint(equalTo: fromViewController.view.widthAnchor, multiplier: 1)
        let height = viewController.view.heightAnchor.constraint(equalTo: fromViewController.view.heightAnchor, multiplier: 1)
        NSLayoutConstraint.activate([width,height])
        
        NSAnimationContext.runAnimationGroup { (context) in
            context.duration = 0.5
            viewController.view.animator().alphaValue = 1
        }
        
    }
    
    func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController) {
        defer {
            viewController.view.removeFromSuperview()
        }
        NSAnimationContext.runAnimationGroup { (context) in
            context.duration = 0.5
            viewController.view.animator().alphaValue = 0
        }
    }
    

}
