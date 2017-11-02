//
//  QQAll.swift
//  QQ空间
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

class QQAll: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1. 创建segmentControl
        
        let items = ["全部", "特别关心", "好友动态", "认证空间"]
        let seg = UISegmentedControl(items: items)
        seg.tintColor = UIColor.gray
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        seg.setTitleTextAttributes(attributes, for: UIControlState.selected)
        seg.selectedSegmentIndex = 0
        
//        seg.addTarget(<#T##target: AnyObject?##AnyObject?#>, action: <#T##Selector#>, forControlEvents: <#T##UIControlEvents#>)
        
        // 2. 设置为titleView
        navigationItem.titleView = seg
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
