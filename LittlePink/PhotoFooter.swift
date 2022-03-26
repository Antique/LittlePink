//
//  PhotoFooter.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/25.
//

import UIKit

class PhotoFooter: UICollectionReusableView {
        
    @IBOutlet weak var addPhotoBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addPhotoBtn.layer.borderWidth=1//边框宽度
        addPhotoBtn.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
    
}
