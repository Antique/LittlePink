//
//  DiscoveryVC.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/22.
//

import UIKit
import XLPagerTabStrip

class DiscoveryVC: ButtonBarPagerTabStripViewController,IndicatorInfoProvider{

    override func viewDidLoad() {
        
        settings.style.selectedBarHeight=0
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 14)
        
        super.viewDidLoad()
        
        containerView.bounces=false
        changeCurrentIndexProgressive={(oldCell:ButtonBarViewCell?,newCell:ButtonBarViewCell?,progressPercentage:CGFloat,changeCurrentIndex:Bool,animated:Bool) -> Void in
            guard changeCurrentIndex == true else {return}
            
            oldCell?.label.textColor = .secondaryLabel//未被选中
            newCell?.label.textColor = .label//选中
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        var vcs:[UIViewController] = []
        for channel in kChannels{
            let vc=storyboard!.instantiateViewController(identifier: kWaterfallVCID)as! WaterfallVC
            vc.channel=channel
            vcs.append(vc)
        }
        return vcs
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title : "发现")
    }
}
