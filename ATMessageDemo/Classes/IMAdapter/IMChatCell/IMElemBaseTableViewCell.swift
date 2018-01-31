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
    // 群聊昵称，群消息的时候有用
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
    // cell的样式
    public var settings: IMElemCellSettings = IMElemCellSettings()
    
    // 要显示的消息弱引用
    public weak var message: IMAdapterMessage?
    public var canShowMenu: Bool = false
    public var showMenuItems: Array<UIMenuItem> = []
    
    // MARK: - 初始化
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
        self.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.cellStyle = .group
        addGroupCellSubViews()
    }
    
    // MARK: - 展示数据
    public func config(aMsg: IMAdapterMessage) {
        self.message = aMsg
        let msg = self.message!
        var sender: IMAdapterUser
        if msg.isMineSend {
            sender = IMAPlatform.shared.host
        } else {
            sender = msg.sender
        }
        avatar.setImage(UIImage(named: sender.avatar)!, for: .normal)
        
        if msg.isGroupMessage {
            remarkTip.isHidden = false
            remarkTip.text = sender.nickname
        } else {
            remarkTip.isHidden = true
            remarkTip.text = ""
        }
        
        configContent()
    }
    
    public func configContent() {
        
    }
    
    // MARK: - 添加子view
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
    
    func addGroupCellSubViews() {
        addSingleCellSubViews()
        
        remarkTip.font = settings.tipFont
        remarkTip.textColor = settings.textColor
        contentView.addSubview(remarkTip)
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
    
    // MARK: - 布局子view
    public override func layoutSubviews() {
        super.layoutSubviews()
        relayoutFrameOfSubViews()
    }
    
    public func relayoutSingleCellViews() {
        let rect = contentView.bounds
        let hor: CGFloat = settings.horizontalMargin
        let ver: CGFloat = hor / 2
        guard let msg = message else { return }
        if msg.isMineSend {
            avatar.frame.size = settings.avatarSize
            avatar.frame.origin.x = super.bounds.width - avatar.frame.width - hor
            avatar.frame.origin.y = 2
        } else {
            avatar.frame.size = settings.avatarSize
            avatar.frame.origin.x = hor
            avatar.frame.origin.y = 2
        }
    }
    
    public func relayoutGroupCellViews() {
        let rect = contentView.bounds
        let hor: CGFloat = settings.horizontalMargin
        let ver: CGFloat = hor / 2
        guard let msg = message else { return }
        if msg.isMineSend {
            avatar.frame.size = settings.avatarSize
            avatar.frame.origin.x = super.bounds.width - avatar.frame.width - hor
            avatar.frame.origin.y = 2
        } else {
            avatar.frame.size = settings.avatarSize
            avatar.frame.origin.x = hor
            avatar.frame.origin.y = 2
        }
    }
    
    public func relayoutFrameOfSubViews() {
        switch cellStyle {
        case .single:
            relayoutSingleCellViews()
        case .group:
            relayoutGroupCellViews()
        }
    }
    
    // MARK: - 显示按钮menu
    public func canShowMenuOnTouchOf(ges: UIGestureRecognizer) -> Bool {
        return false
    }
    
    public func showMenu() {
        let showMenus = showMenuItems
        if showMenus.count >= 1 {
            becomeFirstResponder()
            let menu = UIMenuController.shared
            menu.menuItems = showMenus
            menu.update()
            menu.setTargetRect(contentBg.frame, in: contentView)
            menu.setMenuVisible(true, animated: true)
        }
    }
    
    // MARK: - 其他
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
