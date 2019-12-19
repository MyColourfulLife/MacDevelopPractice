//
//  BindTableViewController.swift
//  List
//
//  Created by Ekko on 2019/12/11.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class BindTableViewController: NSViewController {
    @IBOutlet weak var tableView: MyTableView!
    //KVO使用
    @objc dynamic var datas = [NSDictionary]()
    
    //上下文菜单
    @IBOutlet var menu1: NSMenu!
    @IBOutlet var menu2: NSMenu!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 单机事件
        tableView.action = #selector(clickAction(_:))
        // 双击事件
        tableView.doubleAction = #selector(doubleAction(_:))
        // 选中事件,点击或者使用上下方向键
        tableView.delegate = self
        updateData()
        tableView.menu1 = self.menu1
        tableView.menu2 = self.menu2
    }

    func updateData() {
        self.datas = [
            ["name":"john","address":"USA","gender":"male","married":1],
            ["name":"mary","address":"China","gender":"female","married":0],
            ["name":"park","address":"Japan","gender":"female","married":0],
            ["name":"Daba","address":"Russia","gender":"male","married":1],
        ]
    }
    
    // 配置双击事件
    @IBAction func doubleAction(_ sender:AnyObject) {
        let row = tableView.selectedRow
        print("double Clicked row:\(row)")
    }
    
    @IBAction func clickAction(_ sender:AnyObject){
        let row = tableView.selectedRow
        print("clicked row:\(row)")
    }
    
    
}

extension BindTableViewController:NSTableViewDelegate {
    func tableViewSelectionDidChange(_ notification: Notification) {
        let row = tableView.selectedRow
        print("selected row:\(row)")
    }
}

extension BindTableViewController:NSMenuDelegate {
    // 更新menu菜单
    func menuNeedsUpdate(_ menu: NSMenu) {
        print("menu clicked")
    }
}
// 子类画表格实现不同行列显示不同菜单
class MyTableView: NSTableView {
    var menu1:NSMenu?
    var menu2:NSMenu?
    override func menu(for event: NSEvent) -> NSMenu? {
        // 从window转换坐标点
        let pt = convert(event.locationInWindow, from: nil)
        // 获取鼠标点击的行或列
        let column = self.column(at: pt)
        switch column {
        case 2,3:
            return menu2
        default:
            return menu1
        }
    }
}
