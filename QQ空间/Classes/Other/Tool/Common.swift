//
//  Common.swift
//  QQ空间
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

func isLandScap() -> Bool {
    let bounds = UIScreen.main.bounds
    return bounds.size.width > bounds.size.height
}

// dock宽度
var kDockWidth: CGFloat {
    get {
        return isLandScap() ? 210 : 70
    }
}

// dock tabbar 高度
var kDockTabbarHeight: CGFloat {
    get{
        return isLandScap() ? 70 : 210
    }
}

// dock menue 高度
var kDockMenueHeight: CGFloat {
    return 450
}

// dock headerIcon 高度
var kDockHeaderHeight: CGFloat {
    return isLandScap() ? 130 : 60
}

// dock headerIcon 宽度
var kDockHeaderWidth: CGFloat {
    return isLandScap() ? 100 : 60
}

