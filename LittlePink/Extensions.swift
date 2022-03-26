//
//  Extensions.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/23.
//

import UIKit


extension UITextField{
    var unwrappedText:String{text ?? ""}
}

extension UIView{
    @IBInspectable//在右侧显示一个自定义选项
    //设置Cell为圆角
    var radius:CGFloat{
        get{
            layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
}

extension UIViewController{
    
    //MARK: -显示加载框或提示框
    
    //MARK: 加载框--手动隐藏
    
    //MARK: 提示框--自动隐藏
    func showTextHUD(_ title:String, _ subTitle:String? = nil){
        let hub=MBProgressHUD.showAdded(to: view, animated: true)
        hub.mode = .text//不指定的话，显示菊花和下面配置的文本
        hub.label.text=title//提示框信息
        hub.detailsLabel.text=subTitle
        hub.hide(animated: true, afterDelay: 2)//自动隐藏提示框,时间为2秒
    }
    
    //点击空白处软键盘收起
    func hideKeyboardWhenTappedAround(){
        let tap=UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView=false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

extension Bundle{
    var appName:String{
        if let appName=localizedInfoDictionary?["CFBundleDisplayName"] as? String{
            return appName
        }else{
            return infoDictionary!["CFBundleDisplayName"] as! String
        }
    }
    
    
    static func loadView<T>(fromNib name:String,with type:T.Type)->T{
        if let view=Bundle.main.loadNibNamed("TextViewIAView", owner: nil, options: nil)?.first as? T{
            return view
        }
        fatalError("加载\(type)类型的view失败")
    }
    
}
