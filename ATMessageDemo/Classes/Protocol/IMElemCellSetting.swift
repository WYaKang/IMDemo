//
//  IMElemCellSetting.swift
//  ATMessageDemo
//
//  Created by yakang wang on 2018/1/16.
//  Copyright © 2018年 yakang wang. All rights reserved.
//

import UIKit

public protocol IMElemCellSettingProtocol {
    var message: IMAdapterMessage { get set }

    var textFont: UIFont { get set }
    var textColor: UIColor { get set }
    var tipFont: UIFont { get set }
    var tipColor: UIColor { get set }
    var contentMaxWidth: CGFloat { get set }
    
    /// 各控件间的水平间距
    var horizontalMargin: CGFloat { get set }
    // 用户头像大小
    var avatarSize: CGSize { get set }
    /// 昵称的高度
    var groupNicknameHeight: CGFloat { get set }
    /// 根据具体情况content在气泡背景里的inset
    var bubbleInset: UIEdgeInsets { get set }
    
    /// 只算内容的size
    func contentSizeIn(width: CGFloat) -> CGSize
    /// 带背景图的Size
    func bubbleSizeIn(width: CGFloat) -> CGSize
    /// 显示的高度
    func heightIn(width: CGFloat, in isGroup: Bool) -> Int
}

public final class IMElemCellSettings: IMElemCellSettingProtocol {
    public var message: IMAdapterMessage = IMAdapterMessage(text: "")
    
    public var textFont: UIFont = UIFont.systemFont(ofSize: 16)
    
    public var textColor: UIColor = UIColor.white
    
    public var tipFont: UIFont = UIFont.systemFont(ofSize: 14)
    
    public var tipColor: UIColor = UIColor.white
    
    public var contentMaxWidth: CGFloat = 200
    
    public var horizontalMargin: CGFloat = 10
    
    public var avatarSize: CGSize = CGSize(width: 40, height: 40)
    
    public var groupNicknameHeight: CGFloat = 20
    
    public var bubbleInset: UIEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 7, right: 5)
    
    public func contentSizeIn(width: CGFloat) -> CGSize {
        return .zero
    }
    
    public func bubbleSizeIn(width: CGFloat) -> CGSize {
        return .zero
    }
    
    public func heightIn(width: CGFloat, in isGroup: Bool) -> Int {
        return 0
    }
}


