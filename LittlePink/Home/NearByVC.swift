//
//  NearByVC.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/22.
//

import UIKit
import XLPagerTabStrip

class NearByVC: UIViewController,IndicatorInfoProvider{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title : NSLocalizedString("NearBy", comment: "首页上方的附近标签"))
    }
}
