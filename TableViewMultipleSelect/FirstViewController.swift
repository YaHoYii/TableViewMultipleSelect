//
//  FirstViewController.swift
//  TableViewMultipleSelect
//
//  Created by 太阳在线YHY on 2017/7/6.
//  Copyright © 2017年 太阳在线. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	var array = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()

		for i in 0...30 {
			array.append(i)
		}
		tableView.reloadData()
		
		//设置允许单元格多选,也可以在 StoryBoard 中设置，本例使用的是 storyboard 如果不设置就是单选
		//	tableView.allowsMultipleSelection = true
		
    }

	
	func getSelectRows() {
		// 获取 tableView 被 select 的 row,是一个数组
		if let selecteRows = tableView!.indexPathsForSelectedRows {
			for indexPath in selecteRows {
				 print(indexPath.row)
			}
		}
	}

}

extension FirstViewController: UITableViewDelegate {
	// 选中
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = self.tableView?.cellForRow(at: indexPath)
		cell?.accessoryType = .checkmark
	}
	
	// 取消选中
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		let cell = self.tableView?.cellForRow(at: indexPath)
		cell?.accessoryType = .none
	}
	
}

extension FirstViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		
		return 1
		
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return array.count
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		// 标记对勾的颜色
		cell.tintColor = UIColor.brown
		
		//判断是否选中,如果 tableView有 select 的 row ,就把 cell 标记checkmark
		
		if let _ = tableView.indexPathsForSelectedRows?.index(of: indexPath){
			cell.accessoryType = .checkmark
		} else {
			cell.accessoryType = .none
		}
		
		return cell
	}
	
}

