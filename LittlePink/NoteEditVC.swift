//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/24.
//

import UIKit

class NoteEditVC: UIViewController {
    
    var photos=[
        UIImage(named: "1")!,UIImage(named: "2")!
    ]
    //var videoURL: URL=Bundle.main.url(forResource: "testVideo", withExtension: "mp4")!
    var videoURL: URL?
    
    var channel=""
    var subChannel=""
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var PhotoCollectionview: UICollectionView!
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var channelIcon: UIImageView!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var channelPlaceholderLabel: UILabel!
    
    
    
    
    
    var photoCount:Int{photos.count}
    var isVideo:Bool{videoURL != nil}
    var textViewIAView:TextViewIAView{textView.inputAccessoryView as! TextViewIAView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        
    }
    
    
    @IBAction func TFEditBegin(_ sender: Any) {
        //当用户在标题框输入时
        titleCountLabel.isHidden=false//显示标题框后面的剩余字数提示
    }
    
    @IBAction func TFEditEnd(_ sender: Any) {
        //当用户离开标题框输入时
        titleCountLabel.isHidden=true//隐藏标题框后面的剩余字数提示
    }
    
    //点击软键盘的“完成”使软键盘消失
    @IBAction func TFEndOnExit(_ sender: Any) {}
    
    //实时计算剩余可输入标题文字数量
    @IBAction func TFEditChanged(_ sender: Any) {
        //当前有高亮文本时（拼音键盘）return
        guard titleTextField.markedTextRange == nil else{return}
        
        //用户输入完字符后进行判断，若大于最大字符数，则截取前面的文本（if里面第一行）
        if titleTextField.unwrappedText.count>kMaxNoteTitleCount{
            titleTextField.text=String(titleTextField.unwrappedText.prefix(kMaxNoteTitleCount))
            
            showTextHUD("标题最多输入\(kMaxNoteTitleCount)字")
            
            //用户粘贴文本之后的光标位置，默认会跑到粘贴文本的前面，此处改为末尾
            DispatchQueue.main.async {
                let end=self.titleTextField.endOfDocument
                self.titleTextField.selectedTextRange=self.titleTextField.textRange(from: end, to: end)
            }
            
        }
        titleCountLabel.text="\(kMaxNoteTitleCount-titleTextField.unwrappedText.count)"
    }
    
    //待做（存草稿和发布笔记之前需判断当前用户输入的正文文本数量，看是否大于最大可输入数量）
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let channelVC = segue.destination as? ChannelVC{
            channelVC.PVDelegate=self
        }
    }
    
    
}

extension NoteEditVC:UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        guard textView.markedTextRange == nil else{return}//当前有高亮文本时（拼音键盘）return
        textViewIAView.currentTextCount = textView.text.count
    }
}

extension NoteEditVC:ChannelVCDelegate{
    func updateChannel(channel: String, subChannel: String) {
        //数据
        self.channel=channel
        self.subChannel=subChannel
        //UI
        channelLabel.text=subChannel
        channelIcon.tintColor=blueColor
        channelLabel.textColor=blueColor
        channelPlaceholderLabel.isHidden=true//隐藏话题右边的文字
    }
}


//extension NoteEditVC:UITextFieldDelegate{
//    //如果输入文字数量大于最大限制，则无法输入
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //range.location--当前输入的字符或粘贴文本的第一个字符的索引
        //string--当前输入的某个字符或粘贴的文本
//
//        let isExceed=range.location >= kMaxNoteTitleCount || (textField.unwrappedText.count + string.count) > kMaxNoteTitleCount
//
//        if isExceed{
//            showTextHUD("标题最多输入\(kMaxNoteTitleCount)字")
//        }
//
//        return !isExceed
//    }
//}


