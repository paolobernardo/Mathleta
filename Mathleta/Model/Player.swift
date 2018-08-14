//
//  Player.swift
//  Mathleta
//
//  Created by Paolo Bernardo on 14/08/18.
//  Copyright © 2018 Paolo Bernardo. All rights reserved.
//

import Foundation
import RealmSwift

class Player: Object{
    
    @objc dynamic var name = ""
    @objc dynamic var score : Int = 0
    @objc dynamic var level : Int = 1
    
    
    
}
