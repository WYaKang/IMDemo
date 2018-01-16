//
//  IMElemBaseTableViewCell.swift
//  ATMessageDemo
//
//  Created by yakang wang on 2018/1/15.
//  Copyright © 2018年 yakang wang. All rights reserved.
//

import UIKit

public class IMElemBaseTableViewCell: UITableViewCell, IMElemCellAble {
    
    // 用户头像
    fileprivate let avatar: UIButton
    // 用户remark，群消息的时候有用
    fileprivate let remarkTip: UILabel
    // 聊天内容气泡
    fileprivate let contentBg: UIImageView
    // 实际聊天内容显示控件
    fileprivate var elemContentRef: UIView
    // 发送提示
    fileprivate weak var sendingTipRef: (IMElemSendingViewAble & UIView)?
    // 选中按钮
    fileprivate weak var pickedViewRef: (IMElemPickedViewAble & UIView)?
    // 样式
    fileprivate var cellStyle: IMElemCellType
    // 要显示的消息弱引用
    fileprivate weak var msg: IMAdapterMessage?
//    var msgKVO: FBKVOController?
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.avatar = UIButton(type: .custom)
        self.remarkTip = UILabel()
        self.contentBg = UIImageView()
        self.elemContentRef = UIView()
        self.cellStyle = .single
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required public convenience init(single reuseIdentifier: String) {
        self.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.cellStyle = .single
        addSingleCellSubViews()
    }
    
    required public convenience init(group reuseIdentifier: String) {
        
    }
    
    
    
    public var message: IMAdapterMessage?
    
    public func config(message: IMAdapterMessage) {
        
    }
    
    private var _canShowMenu: Bool = false
    public var canShowMenu: Bool {
        get {
            return _canShowMenu
        }
        set {
            _canShowMenu = newValue
        }
    }
    
    private var _showMenuItems: Array<Any> = []
    public var showMenuItems: Array<Any> {
        get {
            return _showMenuItems
        }
        set {
            _showMenuItems = newValue
        }
    }
    
    public func canShowMenuOnTouchOf(ges: UIGestureRecognizer) -> Bool {
        return false
    }
    
    public func showMenu() {
        
    }
    
    
    func addSingleCellSubViews() {
        contentView.addSubview(avatar)
        contentBg.isUserInteractionEnabled = true
        contentView.addSubview(contentBg)
        if let elemView = addElemContent() {
            elemContentRef = elemView
            contentBg.addSubview(elemContentRef)
        }
        
        if let sendingTips = addSendingTips() {
            sendingTipRef = sendingTips
            contentView.addSubview(sendingTips)
        }
        
        if let pickedView = addPickedView() {
            pickedViewRef = pickedView
            pickedViewRef!.isHidden = true
            contentView.addSubview(pickedView)
        }
    }
    
    func addElemContent() -> UIView? {
        return nil
    }
    
    func addSendingTips() -> (IMElemSendingViewAble & UIView)? {
        return nil
    }
    
    func addPickedView() -> (IMElemPickedViewAble & UIView)? {
        return nil
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
