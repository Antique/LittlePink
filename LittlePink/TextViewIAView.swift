//
//  TextViewIAView.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/25.
//

import UIKit

class TextViewIAView: UIView {

    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var texeCountStackView: UIStackView!
    @IBOutlet weak var textCountLabel: UILabel!
    @IBOutlet weak var maxTextCountLabel: UILabel!
    
    //文本输入字符数量限制
    var currentTextCount=0{
        didSet{
            if currentTextCount <= kMaxNoteTextCount{
                //如果当前输入字符数量小于最大数量
                doneBtn.isHidden=false//显示'完成'按钮
                texeCountStackView.isHidden=true//隐藏当前字符数
            }else {
                doneBtn.isHidden=true//隐藏'完成'按钮
                texeCountStackView.isHidden=false//显示当前字符数
                textCountLabel.text="\(currentTextCount)"
            }
        }
    }

}
