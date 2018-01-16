//
//  ATMessageType.swift
//  MOJietu
//
//  Created by yakang wang on 2018/1/15.
//  Copyright © 2018年 jietu. All rights reserved.
//

import UIKit

/* 消息内容类型:
 0 - 时间
 1 - 文本
 2 - 转账
 3 - 语音
 4 - 图片
 5 - 红包
 6 - 电话
 7 - 大表情
 8 - 系统
 9 - 戳一戳
 10 - 收钱    // 支付宝 发起收钱
 11 - 群红包
 */
public enum MessageContentType: Int {
    case unknown                = -1
    case time                   = 0
    case text                   = 1
    case transfer               = 2
    case sound                  = 3
    case image                  = 4
    case redEnvelope            = 5
    case phone                  = 6
    case face                   = 7
    case system                 = 8
    case poke                   = 9
    case incomeMoney            = 10
    case groupRedEnvelope       = 11
    case file                   = 13
    case gameEmoticon           = 14
}

extension MessageContentType {
}

public enum MessageDirection: Int {
    /// 我是发送者
    case `self` = 1
    /// 对方是发送者
    case other  = 2
}

public enum LogicType: Int {
    /// 模拟器
    case simulator = 1
    /// 快速做图
    case quickPic = 2
}

public enum ChatFileType {
    public enum ExtenName: String {
                case pptx = ".pptx"
                case docx = ".docx"
                case xlsx = ".xlsx"
                case rar = ".rar"
                case txt = ".txt"
                case ppt = ".ppt"
                case doc = ".doc"
                case xls = ".xls"
                case zip = ".zip"
                case pdf = ".pdf"
    }
    case unkown(lastName: String)
    case name(last: ExtenName)
}

extension ChatFileType {
    static let allFiles: [ChatFileType] = [.name(last: .pptx),
                                           .name(last: .docx),
                                           .name(last: .xlsx),
                                           .name(last: .rar),
                                           .name(last: .txt),
                                           .name(last: .ppt),
                                           .name(last: .doc),
                                           .name(last: .xls),
                                           .name(last: .zip),
                                           .name(last: .pdf),]
}

public enum ChatFileUnits: String {
    case b  = "B"
    case kb = "K"
    case mb = "M"
    case gb = "G"
}

public enum ChatFileStatus: String {
    case none = ""
    case sent  = "已发送"
    case upload  = "已上传"
    case download = "已下载"
    case undownload = "未下载"
    //    // 单聊对方已下载 需要发送系统消息
    //    case otherDownload = "已发送"
}

public enum ConversationType: Int {
    /// 0是系统
    case system = 0
    /// 1是个人
    case personal = 1
    /// 2是群组
    case group  = 2
    /// 服务号
    case publicServer = 3
    /// 订阅号
    case publicSubscribe = 4
}

// 通话状态
public enum TalkingType: String {
    case connected = "已接通"
    case unConnect = "未接听"
    case rejected  = "已拒绝"
    case cancel    = "已取消"
}

public enum PhoneType {
    case voice
    case video
}

// 戳一戳类型
public enum PokeType: Int {
    case liu66      = 0
    case biXin      = 1
    case chuo       = 2
    case daZhao     = 3
    case xinSui     = 4
    case zan        = 5
    case gouyin     = 6
    case qiaomen    = 7
    case suiping    = 8
    case zhuayixia  = 9
}

extension PokeType {
    var title: String {
        switch self {
        case .liu66:
            return "666"
        case .biXin:
            return "比心"
        case .chuo:
            return "戳一戳"
        case .daZhao:
            return "放大招"
        case .xinSui:
            return "心碎"
        case .zan:
            return "点赞"
        case .gouyin:
            return "勾引"
        case .qiaomen:
            return "敲门"
        case .suiping:
            return "碎屏"
        case .zhuayixia:
            return "抓一下"
        }
    }
}

// 交易是否完成
public enum TransferStatusType: Int {
    case success = 1 // 交易成功
    case failure = 2 // 交易失败
    case refunds = 3 // 有退款
    case waiting = 4 // 等待对方收款
}




