//
//  Extensions.swift
//  VPNGO
//
//  Created by Ekko on 2019/12/31.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

extension NSStoryboardSegue {
    public var destinationViewController:NSViewController? {
        if let viewContrl = destinationController as? NSViewController {
            return viewContrl
        } else if let windowCtr = destinationController as? NSWindowController {
            return windowCtr.contentViewController
        }
        return nil
    }
}

extension NSTextField {
    public func shake() {
        wantsLayer = true
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.isAdditive = true
        animation.duration = 0.5
        animation.values = [-15,15,-10,10,-7,7,-5,5]
        animation.isRemovedOnCompletion = true
        layer?.add(animation, forKey: nil)
    }
    public  func setBasicStyle() {
        focusRingType = .none
        isBordered = false
    }
}

extension NSView {
   public func setBorderRadius(_ radius:CGFloat = 3)  {
        wantsLayer = true
        layer?.cornerRadius = radius
    }
    
   public func setBgColor(_ color:NSColor = NSColor.clear) {
        wantsLayer = true
        layer?.backgroundColor = color.cgColor
    }
    
    public func startCircleAnimtion(clockwise:Bool = true) {
        wantsLayer = true
        // 注意⚠️，修改了anchorPoint会变更frame，无法实现预期在效果。在macOS上anchorPoint默认为(0,0)
        let oldFrame = layer?.frame
        layer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        layer?.frame = oldFrame!
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        let from:CGFloat = CGFloat.pi * 2
        let end:CGFloat = 0
        rotateAnimation.fromValue = clockwise ? from : end
        rotateAnimation.toValue = clockwise ? end : from
        rotateAnimation.duration = 1
        rotateAnimation.isAdditive = true
        rotateAnimation.repeatDuration = CFTimeInterval.infinity
        layer?.add(rotateAnimation, forKey: "rotateAnimation")
    }
    
    public func stopCircleAnimation() {
        layer?.removeAnimation(forKey: "rotateAnimation")
    }
}
