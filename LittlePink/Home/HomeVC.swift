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
        super.viewDidLoad()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC=storyboard!.instantiateViewController(identifier: kFollowVCID)
        let nearByVC=storyboard!.instantiateViewController(identifier: kNearByVCID)
        let discoveryVC=storyboard!.instantiateViewController(identifier: kDisCoveryVCID)
        
        return [followVC,nearByVC,discoveryVC]
    }
    
}
