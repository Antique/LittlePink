//
//  NoteEditVC-DragDrop.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/25.
//

import Foundation

//MARK: -UICollectionViewDragDelegate
//拖拽
extension NoteEditVC:UICollectionViewDragDelegate{
    //拖拽单个
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        //可用indexpath判断某section或某item是否可拖动，若不可拖动则返回数组
        
        let photo=photos[indexPath.item]
        let dragItem=UIDragItem(itemProvider: NSItemProvider(object: photo))
        dragItem.localObject=photo
        
        return [dragItem]
        
    }
    
    //拖拽多个
    //若一次拖动多个，需实现itemsForAddingTo方法
    //若要改变拖拽时cell外观，需实现dragPreviewParametersForItemAt方法
    
}
//MARK: -UICollectionViewDropDelegate
//放下
extension NoteEditVC:UICollectionViewDropDelegate{
    //拖着移动时-可选实现，一般都实现，频繁调用，代码尽可能快速简单执行
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        //DropProposal--放开cell的方案
        //若实现section间不可拖拽的功能：可定全局变量drapingIndexPath,在itemsForBeginning中赋值为indexPath，然后对比section是否等于destinationIndexPath的section,若等于则返回forbidden。
        
        
        if collectionView.hasActiveDrag{
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        
        if coordinator.proposal.operation == .move,
           let item = coordinator.items.first,
           let sourceIndexPath = item.sourceIndexPath,
           let destinationIndexPath = coordinator.destinationIndexPath{
            
            collectionView.performBatchUpdates {
                photos.remove(at: sourceIndexPath.item)
                photos.insert(item.dragItem.localObject as! UIImage, at: destinationIndexPath.item)
                collectionView.moveItem(at: sourceIndexPath, to: destinationIndexPath)
            }
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)//拖拽动画更流畅
        }
    }
    
}
