//
//  FllowVC.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/22.
//

import UIKit
import XLPagerTabStrip

class FollowVC: UIViewController,IndicatorInfoProvider{

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title : NSLocalizedString("Follow", comment: "首页上方的关注标签"))
        
        
    }
}
