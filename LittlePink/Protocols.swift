//
//  Protocols.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/25.
//

import Foundation

protocol ChannelVCDelegate{
    /// 用户从选择话题页面返回编辑笔记页面传值用
    /// - Parameter channel: 传回来的channel
    /// - Parameter subChannel: 传回来的subChannel
    func updateChannel(channel:String,subChannel:String)
}
