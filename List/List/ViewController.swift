//
//  ViewController.swift
//  List
//
//  Created by Ekko on 2019/12/11.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!
    var datas = [NSDictionary]()
    override func viewDidLoad() {
        super.viewDidLoad()

        updateData()
        sortConfig()
    }

    func updateData() {
        self.datas = [
            ["name":"john","address":"USA","gender":"male","married":1],
            ["name":"mary","address":"China","gender":"female","married":0],
            ["name":"park","address":"Japan","gender":"female","married":0],
            ["name":"Daba","address":"Russia","gender":"male","married":1],
        ]
    }

    // 设置排序
    func sortConfig() {
        // 设置每一列的排序描述即可
        for column in tableView.tableColumns {
            column.sortDescriptorPrototype = NSSortDescriptor(key: column.identifier.rawValue, ascending: true,selector: #selector(NSString.localizedStandardCompare(_:)))
        }
    }
    
    // 增删
    @IBAction func addTableRowButtonCllicked(_ sender: NSButton) {
        // 增加数据源
        let data:NSDictionary = ["name":"","address":"","gender":"male","married":0]
        datas.append(data)
        // 刷新列表
        tableView.reloadData()
        // 定位到新增的行
        tableView.editColumn(0, row: datas.count - 1, with: nil, select: true)
    }
    
    @IBAction func removeTableRowButtonClicked(_ sender: NSButton) {
        let row = tableView.selectedRow
        if row < 0 {
            return
        }
        // 删除数据源
        datas.remove(at: row)
        tableView.reloadData()
    }
    
}

extension ViewController:NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let data = datas[row]
        // 获取列标示
        let key = tableColumn?.identifier
        // 获取数据
        let value = data[key!]
        return value
    }
    // 编辑cellBase的数据
    func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
        // 获取数据源中的数据
        let data = datas[row]
        // 获取列标示
        let key = (tableColumn?.identifier)!
        // 转为可编辑的对象
        let editData = NSMutableDictionary(dictionary: data)
        editData[key] = object
        self.datas[row] = editData
    }
}


