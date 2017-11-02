//
//  QQShuoshuoVC.swift
//  QQ空间
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

class QQShuoshuoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: UIBarButtonItemStyle.done, target: self, action: #selector(close))
        
    }

     @objc func close() {
        dismiss(animated: true, completion: nil)
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
