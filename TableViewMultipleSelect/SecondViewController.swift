//
//  SecondViewController.swift
//  TableViewMultipleSelect
//
//  Created by 太阳在线YHY on 2017/7/6.
//  Copyright © 2017年 太阳在线. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
		// 允许编辑
		tableView.isEditing = true
		//编辑状态下允许多选
		tableView.allowsMultipleSelectionDuringEditing = true
		
		// 长按手势
		let longPress = UILongPressGestureRecognizer(target:self,
		                                             action:#selector(longPressed))
		longPress.delegate = self
		longPress.minimumPressDuration = 1.0
		//  添加长按手势
		tableView.addGestureRecognizer(longPress)
    }


}

extension SecondViewController: UITableViewDelegate {
	// 选中
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}

}

extension SecondViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		
		return 1
		
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return 30
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
		
		// 选中的颜色
		cell.tintColor = UIColor.brown
	
		return cell
	}
	
}

extension SecondViewController: UIGestureRecognizerDelegate {
	
	// 长按事件响应
	func longPressed(gestureRecognizer:UILongPressGestureRecognizer)
	{
		if (gestureRecognizer.state == .ended)
		{
			
			if(self.tableView!.isEditing == false) {
				// 选中
				self.tableView!.setEditing(true, animated:true)
			}
			else {
				// 取消选中
				self.tableView!.setEditing(false, animated:true)
			}
		}
	}
}

extension Array {
	//Array方法扩展，支持根据索引数组删除
	mutating func removeAt(indexes: [Int]) {
		for i in indexes.sorted(by: >) {
			self.remove(at: i)
		}
	}
}
