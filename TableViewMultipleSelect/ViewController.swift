//
//  ViewController.swift
//  TableViewMultipleSelect
//
//  Created by 太阳在线YHY on 2017/7/6.
//  Copyright © 2017年 太阳在线. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	// 创建一个数组用来存储选中的 cell 的行
	var selectedIndexs: [Int] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}

}


extension ViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let cell = tableView.cellForRow(at: indexPath) as! MultipleChoiceTableViewCell
		
		//判断该行原先是否选中
		if let index = selectedIndexs.index(of: indexPath.row){
			// 先移除之前选中现在不选中的行
			selectedIndexs.remove(at: index)
			//原来选中的取消选中
			cell.selectImage.image = UIImage(named:"未点击")
		}else{
			// 先添加选中行的数据
			selectedIndexs.append(indexPath.row)
			// 然后视图改变图片为选中的图片
			cell.selectImage.image = UIImage(named:"点击")
		}
		
		//刷新该行,刷新点击行的状态就行了 ，刷新整个 tableView 没有必要，cell 的图片就是选中或者未选中的样子了
		self.tableView?.reloadRows(at: [indexPath], with: .automatic)
	}
	
}

extension ViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		
		return 1
		
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return 30
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "MultipleChoiceTableViewCell", for: indexPath) as! MultipleChoiceTableViewCell

		//判断是否选中
		if selectedIndexs.contains(indexPath.row) {
			// 如果数组中包含则选中
			cell.selectImage.image = UIImage(named:"点击")
		} else {
			// 不包含则不选中
			cell.selectImage.image = UIImage(named:"未点击")
		}
		
		return cell
	}
	
}
