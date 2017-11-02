//
//  QQLoginVC.swift
//  QQ空间
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

//
class QQLoginVC: UIViewController {

    // 做动画的视图
    @IBOutlet weak var animatedView: UIView!
    
    // 记住密码
    @IBOutlet weak var rememberPwdBtn: UIButton!
    
    // 自动登录
    @IBOutlet weak var autoLoginBtn: UIButton!
    
    // 用户名
    @IBOutlet weak var accountTF: UITextField!
    
    // 密码
    @IBOutlet weak var passwordTF: UITextField!
    
    // 动画转圈
    @IBOutlet weak var juhua: UIActivityIndicatorView!
    
}


// 业务逻辑处理
extension QQLoginVC {
    // 登录
    @IBAction func login() {
        
        // 获取用户名, 和密码
        let account = accountTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        // 登录之前做的处理
        prelogin()
        // 发送给服务器, 验证身份
        QQLoginTool.login(account: account, password: password) { (isSuccess : Bool) in
            if isSuccess {
                print("成功")
                //跳转界面
                UIApplication.shared.keyWindow?.rootViewController = QQHomeVC()
            } else {
                print("用户名,或者密码错误")
                self.loginError()
                
                //提示信息
                QQMessageTool.showMessage(messageStr: "用户名或者密码错误", toVC: self)
            }
            // 登录完成之后做的处理
            self.endLogin()
        }
        
        
    }
    // 记住密码(如果记住密码, 是勾选掉的情况, 要求, 自动登录也取消)
    @IBAction func rememberPwd() {
        rememberPwdBtn.isSelected = !rememberPwdBtn.isSelected
        if !rememberPwdBtn.isSelected {
            autoLoginBtn.isSelected = false
        }
        
    }
    // 自动登录(如果自动登录选中, 要求, 记住密码也选中)
    @IBAction func autoLogin() {
        autoLoginBtn.isSelected = !autoLoginBtn.isSelected
        if autoLoginBtn.isSelected {
            rememberPwdBtn.isSelected = true
        }
    }
    
    func prelogin() -> () {
        
        // 1. 禁止用户交互
        view.isUserInteractionEnabled = false
        // 2. 转圈动画开始
        juhua.startAnimating()
    }
    
    func endLogin() -> () {
        
        // 1. 开启用户交互
        view.isUserInteractionEnabled = true
        
        // 2. 转圈动画停止
        juhua.stopAnimating()
        
    }
    
    func loginError() -> () {
        //抖一抖
        animatedView.layer.removeAnimation(forKey: "error")
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.values = [-16, 0, 16, 0]
        animation.duration = 0.2
        animation.repeatCount = 3
        animatedView.layer.add(animation, forKey: "error")
        
    }
    
}




// 专门放界面处理
extension QQLoginVC {
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}

extension QQLoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == accountTF {
            // 让密码输入框, 获取焦点
            passwordTF.becomeFirstResponder()
        }
        
        
        if textField == passwordTF {
            // 执行登录逻辑
            print("登录")
            // 执行业务逻辑login()
            login()
        }
        
        
        
        return true
        
    }
}


