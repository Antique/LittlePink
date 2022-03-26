//
//  ChannelVC.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/25.
//

import UIKit
import XLPagerTabStrip
//import simd

class ChannelVC: ButtonBarPagerTabStripViewController {
    
    var PVDelegate:ChannelVCDelegate?

    override func viewDidLoad() {
        //selectedBar--按钮下方的条
        settings.style.selectedBarHeight=2
        settings.style.selectedBarBackgroundColor=mainColor
        //buttonBarItem--文本或图片的按钮
        settings.style.buttonBarItemBackgroundColor = .clear//设置上方选项栏的背景颜色
        settings.style.buttonBarItemFont = .systemFont(ofSize: 15)
        
        super.viewDidLoad()
        
        containerView.bounces=false
        changeCurrentIndexProgressive={(oldCell:ButtonBarViewCell?,newCell:ButtonBarViewCell?,progressPercentage:CGFloat,changeCurrentIndex:Bool,animated:Bool)->Void in
            guard changeCurrentIndex == true else {return}
            oldCell?.label.textColor = .secondaryLabel//未被选中
            newCell?.label.textColor = .label//选中
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var vcs: [UIViewController] = []
        for i in kChannels.indices{
            let vc=storyboard!.instantiateViewController(withIdentifier: kChannelTableVCID)as! ChannelTableVC
            //待做（之后这两个数据都需从服务端取）
            vc.channel=kChannels[i]
            vc.subChannels=kAllSubChannels[i]
            vcs.append(vc)
        }
        return vcs
    }
    
}
