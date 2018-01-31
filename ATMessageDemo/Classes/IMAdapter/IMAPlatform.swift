//
//  IMAPlatform.swift
//  ATMessageDemo
//
//  Created by yakang wang on 2018/1/16.
//  Copyright © 2018年 yakang wang. All rights reserved.
//

import UIKit

let kHostId: String = "-1"

class IMAPlatform {
    
    public static let shared: IMAPlatform = IMAPlatform()
    private(set) public var host: IMAdapterUser

    private init() {
        self.host = IMAdapterUser(id: kHostId)
    }
    
}
