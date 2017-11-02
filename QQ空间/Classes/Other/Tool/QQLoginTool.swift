//
//  QQLoginTool.swift
//  QQ空间
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

class QQLoginTool: NSObject {

    class func login(account : String, password : String, result : @escaping (_ isSuceess : Bool)->()){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            if account == "wex" && password == "123" {
                result(true)
            }else {
                result(false)
            }
        }
        
    }
}
