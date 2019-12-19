//
//  ViewController.swift
//  Controller
//
//  Created by Ekko on 2019/12/12.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    
    @IBAction func presentAsModelAction(_ sender: NSButton) {
        let sceneIdentifier = NSStoryboard.SceneIdentifier.init(stringLiteral: "PresentVC")
        let presentVC = storyboard?.instantiateController(withIdentifier: sceneIdentifier) as? NSViewController
        presentAsModalWindow(presentVC!)
    }
    
    @IBAction func presentAsSheetAction(_ sender: NSButton) {
        let sceneIdentifier = NSStoryboard.SceneIdentifier.init(stringLiteral: "PresentVC")
        let presentVC = storyboard?.instantiateController(withIdentifier: sceneIdentifier) as? NSViewController
        presentAsSheet(presentVC!)
    }
    
    @IBAction func presentAsPopoverAction(_ sender: NSButton) {
        let sceneIdentifier = NSStoryboard.SceneIdentifier.init(stringLiteral: "PresentVC")
        let presentVC = storyboard?.instantiateController(withIdentifier: sceneIdentifier) as? NSViewController
        present(presentVC!, asPopoverRelativeTo: sender.bounds, of: sender, preferredEdge: .maxX, behavior: .transient)
    }
    
    @IBAction func presentCustomAniatorAction(_ sender: NSButton) {
        let sceneIdentifier = NSStoryboard.SceneIdentifier.init(stringLiteral: "PresentVC")
        let presentVC = storyboard?.instantiateController(withIdentifier: sceneIdentifier) as? NSViewController
        let animator = PresentCustomAnimator()
        present(presentVC!, animator: animator)
    }
    
    // 父视图所属的两个子视图切换，要求拥有相同的父视图
    @IBAction func showAction(_ sender: NSButton) {
        let sceneIdentifier = NSStoryboard.SceneIdentifier.init(stringLiteral: "PresentVC")
        let fromVC = storyboard?.instantiateController(withIdentifier: sceneIdentifier) as? NSViewController
        
        let sceneIdentifierto = NSStoryboard.SceneIdentifier.init(stringLiteral: "toVC")
        let toVC = storyboard?.instantiateController(withIdentifier: sceneIdentifierto) as? NSViewController
        
        addChild(fromVC!)
        addChild(toVC!)
        
        //显示from视图
        view.addSubview(fromVC!.view)
        
        transition(from: fromVC!, to: toVC!, options: .crossfade, completionHandler: nil)
    }
    
}

