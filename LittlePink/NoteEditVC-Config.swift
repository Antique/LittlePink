//
//  NoteEditVC-Config.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/25.
//

import Foundation
import UIKit

extension NoteEditVC{
    func config(){
        hideKeyboardWhenTappedAround()//点击空白处软键盘收起
        
        //MARK: collectionview
        PhotoCollectionview.dragInteractionEnabled=true//开启拖拽交互
        
        //MARK: titleCountLabel
        titleTextField.text="\(kMaxNoteTitleCount)"
        
        //MARK: textView
        //去除文本和placeholder的上下左右边距
        let lineFragmentPadding=textView.textContainer.lineFragmentPadding
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -lineFragmentPadding, bottom: 0, right: -lineFragmentPadding)
        //行间距
        //改变文本大小和光标大小，使两者大小一样
        let paragraphStyle=NSMutableParagraphStyle()
        paragraphStyle.lineSpacing=6
        let typingAttributes:[NSAttributedString.Key:Any]=[
            .paragraphStyle:paragraphStyle,
            .font:UIFont.systemFont(ofSize: 14),//字体大小
            .foregroundColor:UIColor.secondaryLabel//字体颜色
        ]
        textView.typingAttributes = typingAttributes
        //改变光标颜色，storyboard中选颜色
        textView.tintColorDidChange()
        //软键盘上的view
        textView.inputAccessoryView=Bundle.loadView(fromNib: "TextViewIAView", with: TextViewIAView.self)
            textViewIAView.doneBtn.addTarget(self, action: #selector(resignTextView), for: .touchUpInside)
            textViewIAView.maxTextCountLabel.text="/\(kMaxNoteTextCount)"
        
        
    }
}

//MARK: -监听
extension NoteEditVC{
    //点击‘完成’收起软键盘
    @objc private func resignTextView(){
        textView.resignFirstResponder()
    }
}
