//
//  QQDock.swift
//  QQ空间
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

protocol QQDockDelegate: QQMenueDelegate, QQTabbarDelegate {
    func dockDidClickHeader() -> ()
}

class QQDock: UIView {
    
    var delegate: QQDockDelegate? {
        didSet{
            middle.delegate = delegate
            bottom.delegate = delegate
        }
    }
    

    // 通过懒加载, 创建3个控件
    // 创建底部控件占位
    lazy var bottom: QQTabbar = {
        let bottom = QQTabbar()
        bottom.backgroundColor = UIColor.clear
        self.addSubview(bottom)
        return bottom
        
    }()
    
    // 创建中间控件占位
    lazy var middle: QQMenue = {
        let middle = QQMenue()
        middle.backgroundColor = UIColor.clear
        self.addSubview(middle)
        return middle
        
    }()
    
    // 懒加载顶部控件
    lazy var headerIcon: QQHeaderBtn = {
        
        let btn = QQHeaderBtn()
        btn.setImage(UIImage(named: "icon.jpg"), for: UIControlState.normal)
        btn.setTitle("小码哥", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(headerClick), for: .touchDown)
        self.addSubview(btn)
        return btn
        
    }()
    
    @objc func headerClick() -> () {
        delegate?.dockDidClickHeader()
        middle.clearAll()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 1. 布局底部控件
        bottom.frame = CGRect(x: 0, y: self.height - kDockTabbarHeight, width: self.width, height: kDockTabbarHeight)
        // 2. 布局中间控件
        middle.frame = CGRect(x: 0, y: self.height - kDockTabbarHeight - kDockMenueHeight, width: self.width, height: kDockMenueHeight)
        
        // 3. 布局顶部视图
        let width: CGFloat = kDockHeaderWidth
        let height: CGFloat = kDockHeaderHeight
        let y: CGFloat = 150
        let x: CGFloat = (self.width - width) * 0.5
        headerIcon.frame = CGRect(x: x, y: y, width: width, height: height)
        
    }


}
