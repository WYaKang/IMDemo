//
//  IMAdapterUser.swift
//  ATMessageDemo
//
//  Created by yakang wang on 2018/1/16.
//  Copyright © 2018年 yakang wang. All rights reserved.
//

import UIKit

class IMAdapterUser: IMAdapterUserType {
    var Id: String
    
    var avatar: String
    
    var nickname: String
    
    var remark: String
    
    var userId: String
    
    init(id: String) {
        self.Id = id
        self.avatar = ""
        self.nickname = ""
        self.remark = ""
        self.userId = ""
    }
    
}
