//
//  NoteEditVC-CollectionView.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/25.
//

import YPImagePicker
import SKPhotoBrowser
import AVKit

//MARK: -UICollectionViewDataSource
extension NoteEditVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellID, for: indexPath)as! PhotoCell
        
        cell.imageView.image=photos[indexPath.item]
        
        //cell.contentView.layer.cornerRadius=10//设置发布笔记照片为圆角
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionFooter:
            let photoFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kPhotoFooterID, for: indexPath)as! PhotoFooter
            
            photoFooter.addPhotoBtn.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
            
            
            return photoFooter
        default:
            fatalError("collectuonView的footer出问题了")
        }
    }
    
}
extension NoteEditVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isVideo{
            //添加视频时预览功能
            let playerVC=AVPlayerViewController()
            playerVC.player=AVPlayer(url: videoURL!)
            present(playerVC,animated: true){
                playerVC.player?.play()
            }
        }else{
            //添加图片时预览功能
            // 1. create SKPhoto Array from UIImage
            var images:[SKPhoto] = []
            
            for photo in photos{
                images.append(SKPhoto.photoWithImage(photo))
            }

            // 2. create PhotoBrowser Instance, and present from your viewController.
            let browser = SKPhotoBrowser(photos: images, initialPageIndex: indexPath.item)
            browser.delegate=self
            SKPhotoBrowserOptions.displayAction=false//隐藏分享按钮
            SKPhotoBrowserOptions.displayDeleteButton=true//添加删除按钮
            present(browser, animated: true)
            
        }
    }
}

//MARK: -SKPhotoBrowserDelegate
extension NoteEditVC:SKPhotoBrowserDelegate{
    //添加照片右上角的删除功能实现
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        photos.remove(at: index)
        PhotoCollectionview.reloadData()
        reload()
    }
}

//MARK: - 监听
extension NoteEditVC{
    @objc private func addPhoto(){
        if photoCount<kMaxPhotoCount{
            var config = YPImagePickerConfiguration()
            
            //MARK: 通用配置
            config.albumName=Bundle.main.appName//存图片进相册app的‘我的相簿’里的文件夹名称
            config.screens = [.library]//依次展示相册
            
            //MARK: 相机配置
            config.library.defaultMultipleSelection = true//是否可多选
            config.library.maxNumberOfItems = kMaxPhotoCount-photoCount//选中照片最大数
            config.library.spacingBetweenItems = kSpacingBetweenItems//照片间距
            
            //MARK: Gallery(多选完后的展示和编辑页面)-画廊
            config.gallery.hidesRemoveButton=false//进入展示编辑页面后，可以删除部分图片
            
            
            let picker = YPImagePicker(configuration: config)
            
            //MARK: 选完或按取消按钮后的异步回调处理（依照配置处理单个或多个）
            picker.didFinishPicking { [unowned picker] items, _ in
                for item in items{
                    if case let .photo(photo)=item{
                        self.photos.append(photo.image)
                    }
                }
                
                self.PhotoCollectionview.reloadData()
                
                picker.dismiss(animated: true)
            }
            present(picker, animated: true)
        }else{
            //print("不能再选了")
            showTextHUD("最多只能选择\(kMaxPhotoCount)张照片")
            
        }
    }
}

