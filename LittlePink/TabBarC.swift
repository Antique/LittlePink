//
//  TabBarC.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/23.
//

import UIKit
import YPImagePicker

class TabBarC: UITabBarController,UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        //按下发布按钮弹出自定义界面，
        if viewController is PostVC{
            
            //待做（判断是否登陆）
            
            
            var config = YPImagePickerConfiguration()
            
            //MARK: 通用配置
            config.isScrollToChangeModesEnabled=false//禁止底部左右滑动,防止编辑相册图片时发生手势冲突
            config.onlySquareImagesFromCamera=false//拍摄照片不仅为正方形
            config.albumName=Bundle.main.appName//存图片进相册app的‘我的相簿’里的文件夹名称
            config.startOnScreen = .library//一打开就展示相册
            config.screens = [.library, .video, .photo]//依次展示相册，拍视频，拍照页面
            config.maxCameraZoomFactor = kMaxCameraZoomFactor //相机变焦
            //config.preSelectItemOnMultipleSelection = true
            
            //MARK: 相机配置
            config.library.defaultMultipleSelection = true//是否可多选
            config.library.maxNumberOfItems = kMaxPhotoCount//选中照片最大数
            config.library.spacingBetweenItems = kSpacingBetweenItems//照片间距
            
            //MARK: 视频配置(参照文档，此处全为默认)
            
            //MARK: Gallery(多选完后的展示和编辑页面)-画廊
            config.gallery.hidesRemoveButton=false//进入展示编辑页面后，可以删除部分图片
            
            
            let picker = YPImagePicker(configuration: config)
            
            //MARK: 选完或按取消按钮后的异步回调处理（依照配置处理单个或多个）
            picker.didFinishPicking { [unowned picker] items, cancelled in
                if cancelled{
                    print("用户点击了左上角的取消按钮")
                }
                for item in items{
                    switch item {
                    case let .photo(photo):
                        print(photo)
                    case .video(let video):
                        print(video)
                    }
                }
                
                picker.dismiss(animated: true)
            }
            present(picker, animated: true)
            
            return false
        }
        return true
    }
    
    
    
}
