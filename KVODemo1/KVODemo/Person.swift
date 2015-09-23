//
//  Person.swift
//  KVODemo
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Feiyang. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name:String?
    var money:String?
    init(pName:String, pMoney:String) {
        super.init()
        name = pName
        money = pMoney
    }
}
