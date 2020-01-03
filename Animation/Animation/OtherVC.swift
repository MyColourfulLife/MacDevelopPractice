//
//  OtherVC.swift
//  Animation
//
//  Created by Ekko on 2019/12/28.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class OtherVC: NSViewController,CAAnimationDelegate {

    var shapeLayer:CAShapeLayer!
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.wantsLayer = true
//        view.layer?.backgroundColor = NSColor.cyan.cgColor
//        transitionAnimation()
        addLayer()
        addProgressLayer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (time) in
            if self.shapeLayer.strokeEnd < 1 {
                self.shapeLayer.strokeEnd += 0.1
            }else {
                time.invalidate()
            }
        })
        RunLoop.current.add(timer, forMode: .common)
        addTextLayer()
    }
    
    func transitionAnimation() {
        let transition = CATransition()
        transition.startProgress = 0
        transition.endProgress = 1
        transition.type = .push
        transition.subtype = .fromRight
        transition.duration = 0.25
        view.layer?.add(transition, forKey: nil)
    }
    
    @IBAction func backAction(_ sender: NSButton) {
        let transition = CATransition()
        transition.startProgress = 1
        transition.endProgress = 0
        transition.type = .push
        transition.subtype = .fromRight
        transition.duration = 0.25
        transition.isRemovedOnCompletion = true
        transition.delegate = self
        view.layer?.add(transition, forKey: nil)

    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("done")
                removeFromParent()
                view.removeFromSuperview()
    }
    
    func addLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 150, height: 68)
        // rgba(63, 188, 155, 1)
        let startColor = NSColor(calibratedRed: 63/255, green: 188/255, blue: 155/255, alpha: 1)
//        rgba(130, 255, 194, 1)
        let endColor = NSColor(calibratedRed: 130/255, green: 255/255, blue: 194/255, alpha: 1)
        gradientLayer.colors = [startColor.cgColor,endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        view.layer?.addSublayer(gradientLayer)
    }
    
    func addProgressLayer() {
        shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRect(x: 300, y: 0, width: 200, height: 200)
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 20))
        path.addLine(to: CGPoint(x: 200, y: 20))
        shapeLayer.lineWidth = 10
        shapeLayer.path = path
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 0
        shapeLayer.strokeColor = NSColor.green.cgColor
        view.layer?.addSublayer(shapeLayer)
    }
 
    func addTextLayer() {
        let textLayer = CATextLayer()
        textLayer.fontSize = 14
        textLayer.contentsScale = NSScreen.main!.backingScaleFactor
        textLayer.frame = NSRect(x: 300, y: 15, width: 150, height: 50)
        textLayer.string = "你好，我是TEXTLayer"
        textLayer.alignmentMode = .natural
        textLayer.backgroundColor = NSColor.clear.cgColor
        textLayer.foregroundColor = NSColor.black.cgColor
        view.layer?.addSublayer(textLayer)
    }
}


