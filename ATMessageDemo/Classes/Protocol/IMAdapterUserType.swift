//
//  IMAdapterUserType.swift
//  ATMessageDemo
//
//  Created by yakang wang on 2018/1/16.
//  Copyright © 2018年 yakang wang. All rights reserved.
//

import Foundation

protocol IMAdapterUserType {
    /// 对应数据库Id
    var Id: String { get set }
    /// 头像名字
    var avatar: String { get set }
    /// 昵称
    var nickname: String { get set }
    /// 备注
    var remark: String { get set }
    /// 账号
    var userId: String { get set }
}
