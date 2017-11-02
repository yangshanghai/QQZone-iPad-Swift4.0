//
//  QQHomeVC.swift
//  QQ空间
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

class QQHomeVC: UIViewController {
    
    lazy var leftView : QQDock = {
        let leftView = QQDock()
        leftView.delegate = self
        leftView.backgroundColor = UIColor.clear
//        self.view.addSubview(leftView)
        self.view.insertSubview(leftView, at: 0)
        return leftView
    }()
    
    lazy var rightView: UIView = {
        let rightView = UIView()
        rightView.backgroundColor = UIColor.brown
        let pan = UIPanGestureRecognizer(target: self, action: #selector(QQHomeVC.pan(gester:)))
        rightView.addGestureRecognizer(pan)
        
        self.view.addSubview(rightView)
        return rightView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpInit()
        
        //添加子控制器
        addChildVCs()
        
        // 选中第一个控制器
        dockDidClickHeader()
        
        //创建左侧视图
//        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 210, height: view.height))
//        leftView.backgroundColor = UIColor.orange
//        view.addSubview(leftView)
        
        //创建右侧视图
//        let rightView = UIView(frame: CGRect(x: 210, y: 0, width: view.width - 210, height: view.height))
//        leftView.backgroundColor = UIColor.brown
//        view.addSubview(rightView)
        
        // 横竖屏, 适配, 其实, 就是获知横竖屏切换时的事件, 然后, 在对应的方法里面, 重新调整, 控件大小, 或者, 控件排布, 或者, 控件状态
        //1.通知
//        NotificationCenter.default.addObserver(self, selector: #selector(changeFrame), name: .UIDeviceOrientationDidChange, object: nil)
    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        print("viewWillTransition")
//    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        print("viewWillLayoutSubviews")
        let x: CGFloat = 0
        let y: CGFloat = 0
        let height: CGFloat = view.height
        leftView.frame = CGRect(x: x, y: y, width: kDockWidth, height: height)
        
        rightView.frame = CGRect(x: kDockWidth, y: 0, width: view.width - kDockWidth, height: view.height)
        
        
    }
    
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//
//    @objc func changeFrame() -> () {
//        print("test")
//    }
}

extension QQHomeVC: QQDockDelegate {
    func dockDidClickHeader() {
        // 1. 移除之前添加的视图
        let subView = rightView.subviews.first
        subView?.removeFromSuperview()
        
        // 2. 获取最新的视图,添加进来
        let vc = childViewControllers.last
        vc?.view.frame = rightView.bounds
        rightView.addSubview((vc?.view)!)
    }
        
    func dockTabbarDidSelect(type: QQTabbarType) {
        if type == .Shuoshuo {
            // 弹出一个控制器, 发表说说
            let vc = QQShuoshuoVC()
            vc.view.backgroundColor = UIColor.red
            let nav = UINavigationController(rootViewController: vc)
            
            // 弹出最终的效果
            nav.modalPresentationStyle = .formSheet
            nav.modalTransitionStyle = .flipHorizontal
            present(nav, animated: true, completion: nil)
            
            
        }
        print(type.rawValue)
    }
    func dockMenueDidSelect(index: Int) {
        // 1. 移除之前添加的视图
        let subView = rightView.subviews.first
        subView?.removeFromSuperview()
        
        //2.获取最新的视图，添加进来
        let vc = childViewControllers[index]
        vc.view.frame = rightView.bounds
        rightView.addSubview(vc.view)
 
    }
}

extension QQHomeVC {
    
    func addChildVCs() {
        
        addChildVC(vc: UIViewController(), title: "电子相框")
        addChildVC(vc: UIViewController(), title: "更多")
        addChildVC(vc: QQAll(), title: "全部动态")
        addChildVC(vc: UIViewController(), title: "好友")
        addChildVC(vc: UIViewController(), title: "与我相关")
        addChildVC(vc: UIViewController(), title: "照片墙")
        
        addChildVC(vc: UIViewController(), title: "个人中心")
        
    }
    
    func addChildVC(vc: UIViewController, title: String) {
        vc.title = title
        let nav = UINavigationController(rootViewController: vc)
        addChildViewController(nav)
        
    }
}



// 界面处理
extension QQHomeVC {
    func setUpInit() -> () {
        view.backgroundColor = UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension QQHomeVC {
    
    @objc func pan(gester: UIPanGestureRecognizer) {
        if gester.state == .changed {
            print("计算手指点的位置, 移动内容视图")
            
            let point = gester.translation(in: rightView)
            print(point.x)
            
            var tempFrame = rightView.frame
            tempFrame.origin.x = leftView.bottom.size.width + point.x * 0.4
            rightView.frame = tempFrame
        } else {
            print("恢复内容视图的位置")
            UIView.animate(withDuration: 0.1, animations: {
                self.rightView.x = self.leftView.width
            })
        }
    }
    
    
    
    
    
}
