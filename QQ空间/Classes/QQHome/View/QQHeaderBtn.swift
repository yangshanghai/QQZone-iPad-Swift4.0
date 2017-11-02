//
//  QQHeaderBtn.swift
//  QQ空间
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

class QQHeaderBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let radio : CGFloat = 0.7
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        if isLandScap() {
            return CGRect(x: 0, y: 0, width: contentRect.size.width, height: contentRect.size.height * radio)
        }else {
            return contentRect
        }
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if isLandScap() {
            return CGRect(x: 0, y: contentRect.size.height * radio , width: contentRect.size.width, height: contentRect.size.height * (1 - radio))
        }else {
            return CGRect.zero
        }
    }
    
    
}
