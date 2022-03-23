//
//  HomeVC.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/22.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        
        //MARK: 设置上放的Bar，按钮，条的UI
        
        //整体bar--在story上设置
        
        //selectedBar--按钮下方的条
        settings.style.selectedBarBackgroundColor=UIColor(named: "main")!
        settings.style.selectedBarHeight=3
        
        //buttonBarItem--文本或图片的按钮
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        
        super.viewDidLoad()
        
        
        containerView.bounces=false
        changeCurrentIndexProgressive={(oldCell:ButtonBarViewCell?,newCell:ButtonBarViewCell?,progressPercentage:CGFloat,changeCurrentIndex:Bool,animated:Bool) -> Void in
            guard changeCurrentIndex == true else {return}
            
            oldCell?.label.textColor = .secondaryLabel//未被选中
            newCell?.label.textColor = .label//选中
        }
        
        
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC=storyboard!.instantiateViewController(identifier: kFollowVCID)
        let nearByVC=storyboard!.instantiateViewController(identifier: kNearByVCID)
        let discoveryVC=storyboard!.instantiateViewController(identifier: kDisCoveryVCID)
        
        return [discoveryVC,followVC,nearByVC]
    }
    
}
