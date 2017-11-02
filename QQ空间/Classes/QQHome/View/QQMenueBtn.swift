//
//  QQMenueBtn.swift
//  QQ空间
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

class QQMenueBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView?.contentMode = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let radio: CGFloat = 0.3
    
    //title frame
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if isLandScap() {
            return CGRect(x: radio * contentRect.size.width, y: 0, width: contentRect.size.width * (1 - radio), height: contentRect.size.height)
        } else {
            return CGRect.zero
        }
    }
    // image frame
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        if isLandScap() {
            return CGRect(x: 0, y: 0, width: contentRect.size.width * radio, height: contentRect.size.height)
        } else {
            return contentRect
        }
    }
}
