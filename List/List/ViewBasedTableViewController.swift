//
//  ViewBasedTableViewController.swift
//  List
//
//  Created by Ekko on 2019/12/11.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewBasedTableViewController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!
    var datas = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateData()
    }

    func updateData() {
        self.datas = [
            ["name":"john","address":"USA","gender":"male","married":1],
            ["name":"mary","address":"China","gender":"female","married":0],
            ["name":"park","address":"Japan","gender":"female","married":0],
            ["name":"Daba","address":"Russia","gender":"male","married":1],
        ]
    }
    
}

extension ViewBasedTableViewController:NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return datas.count
    }
}

extension ViewBasedTableViewController:NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        // data
        let data = datas[row]
        // cell
        let key = (tableColumn?.identifier)!
        // cellvalue
        let value = data[key]
        
        // 根据列标示 创建单元视图
        let view = tableView.makeView(withIdentifier: key, owner: self)
        // 获取所有子视图
        let subviews = view?.subviews
        if (subviews?.count)! <= 0 {
            return nil
        }
        
        switch key.rawValue {
        case "name","address":
            let textField = subviews?[0] as! NSTextField
            if value != nil {
                textField.stringValue = value as! String
            }
        case "gender":
            let combox = subviews?[0] as! NSComboBox
            if value != nil {
                combox.stringValue = value as! String
            }
        case "married":
            let checked = subviews?[0] as! NSButton
            if value != nil {
                checked.state = NSControl.StateValue(value as! Int)
            }
        default:
            break
        }
      
        return view
    }
    // 定制选中样式
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        guard let rowView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "rowView"), owner: self) as? CustomTableRowView else {
            let row = CustomTableRowView()
            row.identifier = NSUserInterfaceItemIdentifier(rawValue: "rowView")
            return row
        }
        return rowView
    }
}

// 定制选中样式
class CustomTableRowView: NSTableRowView {
    override func drawSelection(in dirtyRect: NSRect) {
        if selectionHighlightStyle != .none {
            // 绘制选中样式
            NSColor.cyan.setFill()
            dirtyRect.fill()
        }
    }
}
