//
//  IMAdapterMessage.swift
//  ATMessageDemo
//
//  Created by yakang wang on 2018/1/15.
//  Copyright © 2018年 yakang wang. All rights reserved.
//

import UIKit

enum IMElemCellType {
    case single
    case group
}

public class IMAdapterMessage {
    /// 底层消息模型
    public var message: IMMessage
    /// 消息类型文本还是图片类型
    public var type: MessageContentType
    /// status 发送的状态
    
    /// 用来排序使用
    public var orderRank: Int64 = 0
    
    public init(message: IMMessage, type: MessageContentType) {
        self.message = message
        self.type = type
    }
    
    public convenience init(text: String) {
        let elem = IMTextElem(text: text)
        let msg = IMMessage(elem: elem)
        self.init(message: msg, type: .text)
    }
    
    // MARK: 底层SDK返回后封装的
    public convenience init?(message: IMMessage) {
        if message.firstElem == nil { return nil }
        
        var tType: MessageContentType = .unknown
        guard let elem = message.firstElem else { return nil }
        if elem is IMTextElem {
            tType = .text
        } else if elem is IMTextElem {
            tType = .text
        } else if elem is IMImageElem {
            tType = .image
        } else if elem is IMFileElem {
            tType = .file
        } else if elem is IMSoundElem {
            tType = .sound
        } else if elem is IMRedEnvelopeElem {
            tType = .redEnvelope
        } else if elem is IMSystemElem {
            tType = .system
        }
        
        self.init(message: message, type: tType)
        // 变更imAMsg的状态不需要刷新界面
    }
    
    var isMineSend: Bool {
        return message.direction == .self
    }
    
    var isSingleMessage: Bool {
        return message.conversationType == .personal
    }
    
    var isGroupMessage: Bool {
        return message.conversationType == .group
    }
    
    /// 消息发送者
    var sender: IMAdapterUser {
        let user = IMAdapterUser(id: message.senderId.description)
        return user
//        if message.conversationType == .personal {
//        } else if message.conversationType == .group {
//            let user = IMAdapterUser(id: message.senderId.description)
//            return user
//        }
    }
    
}
