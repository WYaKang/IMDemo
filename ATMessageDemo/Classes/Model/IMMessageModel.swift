//
//  ATChatBaseModel.swift
//  MOJietu
//
//  Created by yakang wang on 2018/1/15.
//  Copyright © 2018年 jietu. All rights reserved.
//

public protocol IMElemType { }

import UIKit

/// 文本消息Elem
public class IMTextElem: IMElemType {
    public var richText: NSMutableAttributedString
    
    public init(text: String) {
        self.richText = NSMutableAttributedString(string: text)
    }
}

/// 图片消息Elem
public class IMImageElem: IMElemType {
    public var image: UIImage
    public var path: String
    
    public init?(path: String) {
        self.path = path
        let imageURL = URL(fileURLWithPath: path)
        do {
            let iamgeData = try Data(contentsOf: imageURL)
            if let image = UIImage(data: iamgeData) {
                self.image = image
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}

/// 文件消息Elem
public class IMFileElem: IMElemType {
    /// 文件大小
    public var spaceSize: Double = 0.0
    /// 文件计算单位
    public var unitls: ChatFileUnits = .kb
    /// 文件名
    public var fileName: String = ""
    /// 文件类型
    public var type: ChatFileType = .unkown(lastName: "")
    /// 文件的状态有没有下载
    public var fileStatus: ChatFileStatus = .sent
    
    public init(name: String, size: Double) {
        self.fileName = name
        self.spaceSize = size
    }
}

/// 语音消息Elem
public class IMSoundElem: IMElemType {
    /// 时长单位秒
    public var duration: Int
    /// 是否已读,自己发语音不会判断这个值
    public var isRead: Bool
    
    public init(duration: Int, isRead: Bool = true) {
        self.duration = duration
        self.isRead = isRead
    }
}

/// 红包消息Elem
public class IMRedEnvelopeElem: IMElemType {
    /// 金额
    public var amount: String
    /// 留言祝福语
    public var greetings: String
    /// 是否已经拆开,只有对方发红包才会有值
    public var isOpen: Bool
    
    public init(amount: String, greetings: String = "恭喜发财，大吉大利", isOpen: Bool = false) {
        self.amount = amount
        self.greetings = greetings
        self.isOpen = false
    }
}

/// 视频电话语音电话Elem
public class IMPhoneElem: IMElemType {
    /// 电话类型，是语音还是视频
    public var phoneType: PhoneType = .video
    /// 电话状态，已经连接，已经拒绝等
    public var status: TalkingType = .connected
    /// 默认值
    public var duration: Int = 60
    /// 0已拒绝， 1已接通，2已取消， 当发送人是对方，1，2为未接听的意思
    public var state:Int
    
    init(duration: Int, type: PhoneType, status: TalkingType) {
        self.phoneType = type
        self.duration = duration
        self.status = status
        self.state = 0
    }
}

/// 系统类型的消息
public class IMSystemElem: IMElemType {
    public var richTipText: NSMutableAttributedString
    
    public init(tips: String) {
        self.richTipText = NSMutableAttributedString(string: tips)
    }
}

/// 戳一下
public class IMPokeElem: IMElemType {
    public var type: PokeType
    
    public init(type: PokeType) {
        self.type = type
    }
}

/// 支付宝收钱
public class IMIncomeElem: IMElemType {
    /// 单位为分
    public var amount: Int = 0
    /// 是收款还是付款
    public var isIncome: Bool = true
    /// 理由原因
    public var reason: String
    /// 是否已经完成交易
    public var statusType: TransferStatusType = .waiting
    /// 付款方式
    public var payMeth: String
    /// 订单号
    public var orderNumber: String
    /// 创建订单的的时间
    public var createDate: Date
    
    public init(amount: Int, isIncome: Bool, reason: String = "") {
        self.amount = amount
        self.isIncome = isIncome
        self.reason = reason
        self.statusType = .waiting
        self.payMeth = "余额"
        self.orderNumber = ""
        self.createDate = Date()
    }
}

/// 接收红包的系统消息
public class IMRESystemElem: IMElemType {
    
}

// MARK: - 群系统消息和tip消息

/// 群tips，成员变更信息
public class IMGroupTipsElemMemberInfo {
    
}

/// 群tips，群变更信息
public class IMGroupTipsElemGroupInfo {
    
}

/// 群Tips
public class IMGroupTipsElem: IMElemType {
}

/// 群系统消息
public class IMGroupSystemElem: IMElemType {
}

// MARK: - 消息体
public class IMMessage {
    
    /// 对应数据库中的ID
    public var Id: Int64
    
    /// 是不是我发送的消息
    public var direction: MessageDirection
    
    /// 来自于哪里群组单聊还是公众号
    public var conversationType: ConversationType
    
    /// 当前消息的时间戳
    public var timestamp: Date
    
    /// 消息发送人ID
    public var senderId: Int64 = 0
    
    /// 消息接收人ID
    public var receiverId: Int64 = 0
    
    /// 组装所有的聊天对象
    fileprivate var elemArray: [IMElemType] = []
    
    public init() {
        self.Id = 0
        self.direction = .self
        self.conversationType = .personal
        self.timestamp = Date()
    }
    
    public convenience init(elem: IMElemType) {
        self.init()
        self.addElem(elem)
    }
    
    /// 增加Elem
    public func addElem(_ elem: IMElemType) {
        self.elemArray.append(elem)
    }
    
    /// 获取Elem
    public var firstElem: IMElemType? {
        return elemArray.first
    }
}
