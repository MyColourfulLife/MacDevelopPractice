//
//  ViewController.swift
//  Animation
//
//  Created by Ekko on 2019/12/28.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.yellow.cgColor

        // Do any additional setup after loading the view.
//       startPathAnimation()
        
    }

    func startPathAnimation() {
        view.wantsLayer = true
        let rootLayer = view.layer!
        
        // 创建圆形图层的蒙版
        let circleShapeLayer = CAShapeLayer()
        let shapPath = CGMutablePath()
        shapPath.addEllipse(in: CGRect(x: 0, y: 0, width: 160, height: 160))
        circleShapeLayer.path = shapPath
        
        // 圆形图层
        let circleLayer = CALayer()
        circleLayer.frame = CGRect(x: 60, y: 60, width: 160, height: 160)
        circleLayer.backgroundColor = NSColor.purple.cgColor
        circleLayer.mask = circleShapeLayer
        circleLayer.masksToBounds = true
        rootLayer.addSublayer(circleLayer)
        
        
        // 旋转的图层
        let colorLayer = CALayer()
        colorLayer.frame = CGRect(x: -10, y: -10, width: 20, height: 20)
        colorLayer.backgroundColor = NSColor.green.cgColor
        rootLayer.addSublayer(colorLayer)
        
        // 沿圆形轨迹运行
        let animation = CAKeyframeAnimation(keyPath: "position")
        let ellispsePath = CGMutablePath()
        ellispsePath.addEllipse(in: CGRect(x: 40, y: 40, width: 200, height: 200))
        animation.path = ellispsePath
        animation.rotationMode = .rotateAuto
        animation.repeatCount = 100000
        animation.isAdditive = true
        animation.duration = 2
        animation.calculationMode = .paced
        colorLayer.add(animation, forKey: nil)
        
    }

    @IBAction func pushAction(_ sender: NSButton) {
        let pushedVC = self.storyboard?.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("OtherVC")) as! NSViewController
        addChild(pushedVC)
        view.addSubview(pushedVC.view)
        
        pushedVC.view.translatesAutoresizingMaskIntoConstraints = false
        pushedVC.view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        pushedVC.view.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    @IBAction func printAction(_ sender: NSButton) {
        print("print me")
    }
    

}

