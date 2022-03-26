//
//  Constants.swift
//  LittlePink
//
//  Created by Aixcui on 2022/3/22.
//

import UIKit

//MARK: storyboardID
let kFollowVCID="FollowVCID"
let kNearByVCID="NearByVCID"
let kDisCoveryVCID="DiscoveryVCID"
let kWaterfallVCID="WaterfallVCID"
let kNoteEditVCID="NoteEditVCID"
let kChannelTableVCID="ChannelTableVCID"

//MARK: Cell相关ID
let kWaterfallCellID="WaterfallCellID"
let kPhotoCellID="PhotoCellID"
let kPhotoFooterID="PhotoFooterID"
let kSubChannelCellID="SubChannelCellID"

//MARK: - 资源文件相关
let mainColor=UIColor(named: "main")!
let blueColor=UIColor(named: "blue")!

//MARK: -业务逻辑相关
//瀑布流
let kWaterfallPadding:CGFloat = 4
let kChannels=["推荐","旅行","娱乐","才艺","美妆","白富美","美食","萌宠"]

//MARK: 业务逻辑相关
let kMaxPhotoCount=9//picker选择照片时允许用户最多选几张
let kMaxCameraZoomFactor:CGFloat=5
let kSpacingBetweenItems:CGFloat=2

//笔记
let kMaxNoteTitleCount=20//标题字符数量最大值
let kMaxNoteTextCount=1000//文本字符数量最大值

//话题
let kAllSubChannels=[
    ["穿神马是神马","就快瘦到50斤啦","花5个小时修的靓图","网红店入坑记"],
    ["魔都名媛会长","爬行西藏","无边泳池只要9块9"],
    ["小鲜肉的魔幻剧","国产动画雄起"],
    ["练舞20年","还在玩小提琴吗，我已经尤克里里了哦","巴西柔术","听说拳击能减肥","乖乖交智商税吧"],
    ["粉底没有最厚，只有更厚","最近很火的法属xx岛的面霜"],
    ["我是白富美你是吗","康一康瞧一瞧啦"],
    ["装x西餐厅","网红店打卡"],
    ["我的猫儿子","我的猫女儿","我的兔兔"]
]
