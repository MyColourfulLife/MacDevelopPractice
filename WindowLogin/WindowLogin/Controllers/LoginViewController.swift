//
//  LoginViewController.swift
//  WindowLogin
//
//  Created by Ekko on 2019/12/12.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class LoginViewController: NSViewController {
    deinit {
        print("login view deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func loginButtonAction(_ sender: NSButton) {
        //1.关闭窗口
        view.window?.close()
        //2.发送登陆通知
        NotificationCenter.default.post(name: .loginOK, object: nil)
    }
    
    @IBAction func closeButtonAction(_ sender: NSButton) {
        view.window?.close()
    }
    
}
extension NSNotification.Name {
    static let loginOK = NSNotification.Name("loginOK")
}
