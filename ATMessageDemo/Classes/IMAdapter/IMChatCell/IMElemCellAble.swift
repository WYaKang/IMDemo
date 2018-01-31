//
//  IMElemAbleCell.swift
//  ATMessageDemo
//
//  Created by yakang wang on 2018/1/15.
//  Copyright © 2018年 yakang wang. All rights reserved.
//

import UIKit

public protocol IMElemCellAble: class {
    // 构造方法
    init(single reuseIdentifier: String)
    init(group reuseIdentifier: String)
    
    // 配置及显示
    weak var message: IMAdapterMessage? { get set }
    func config(aMsg: IMAdapterMessage)
    
    // 显示Menu
    var canShowMenu: Bool { get set }
    var showMenuItems: Array<UIMenuItem> { get set }
    func canShowMenuOnTouchOf(ges: UIGestureRecognizer) -> Bool
    func showMenu()
}

public protocol IMElemPickedViewAble: class {
    var selected: Bool { get set }
}

public protocol IMElemSendingViewAble: class {
    func setMessage(status: Int)
}






