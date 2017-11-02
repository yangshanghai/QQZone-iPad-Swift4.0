//
//  QQTabbar.swift
//  QQ空间
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

enum QQTabbarType: Int {
    case Rizhi
    case Shuoshuo
    case Camera
}

protocol QQTabbarDelegate: NSObjectProtocol {
    func dockTabbarDidSelect(type: QQTabbarType)
}

class QQTabbar: UIView {

    weak var delegate: QQTabbarDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 添加三个子控件
        addBtns()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addBtns() -> () {
        let imageNames = ["tabbar_blog", "tabbar_mood", "tabbar_photo"]
        for imageName in imageNames {
            let btn = UIButton()
            btn.setImage(UIImage(named: imageName), for: .normal)
            btn.addTarget(self, action: #selector(QQTabbar.btnClick(btn:)), for: UIControlEvents.touchDown)
            btn.tag = self.subviews.count
            self.addSubview(btn)
        }
    }
    
    @objc func btnClick(btn: UIButton) -> () {
        delegate?.dockTabbarDidSelect(type: QQTabbarType(rawValue: btn.tag)!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 对三个子控件进行布局
        
        var index: CGFloat = 0
        for view in self.subviews {
            if isLandScap() {
                let width = self.width / CGFloat(self.subviews.count)
                view.frame = CGRect(x: index * width, y: 0, width: width, height: self.height)
            } else {
                let height = self.height / CGFloat(self.subviews.count)
                view.frame = CGRect(x: 0, y: index * height, width: self.width, height: height)
            }
            index += 1
        }
        
    }
    
}
