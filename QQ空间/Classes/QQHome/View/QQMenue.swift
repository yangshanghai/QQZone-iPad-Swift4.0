//
//  QQMenue.swift
//  QQ空间
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

protocol QQMenueDelegate {
    func dockMenueDidSelect(index: Int)
}

class QQMenue: UIView {
    
    var lastBtn: UIButton?
    
    
    var delegate: QQMenueDelegate?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addBtns()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clearAll() -> () {
        lastBtn?.isSelected = false
    }
    
    func addBtns() ->  (){
        let imageNames = ["tab_bar_e_album_icon", "tab_bar_e_more_icon", "tab_bar_feed_icon", "tab_bar_friend_icon", "tab_bar_passive_feed_icon", "tab_bar_pic_wall_icon"]
        let titles = ["电子相框", "更多", "全部动态", "好友", "与我相关", "照片墙"]
        for i in 0..<6 {
            addBtn(imageName: imageNames[i], title: titles[i])
        }
    }
    
    func addBtn(imageName: String, title: String) -> () {
        let btn = QQMenueBtn()
        btn.setImage(UIImage(named: imageName), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named:"tabbar_separate_selected_bg"), for: UIControlState.selected)
        btn.setTitle(title, for: UIControlState.normal)
        
        btn.addTarget(self, action: #selector(QQMenue.btnClick(btn:)), for: UIControlEvents.touchDown)
        btn.tag = self.subviews.count
        self.addSubview(btn)
    }
    
    @objc func btnClick(btn: UIButton) -> () {
        lastBtn?.isSelected = false
        btn.isSelected = true
        lastBtn = btn
        delegate?.dockMenueDidSelect(index: btn.tag)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 对子控件进行布局
        
        var index: CGFloat = 0
        let height = self.height / CGFloat(self.subviews.count)
        for view in self.subviews {
            view.frame = CGRect(x: 0, y: index * height, width: self.width, height: height)
            index += 1
        }
    }
    
}
