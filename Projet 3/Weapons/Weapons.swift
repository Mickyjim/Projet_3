//
//  Weapons.swift
//  Projet 3
//
//  Created by Michael Favre on 02/02/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation

// The armory

class Weapons {
    
    //MARK: - Vars
    let name: String
    let damage: Int
    let heal: Int
    
    //MARK: - Init
    init(name: String, damage: Int, heal: Int) {
        self.name = name
        self.damage = damage
        self.heal = heal
    }
    
    //MARK: - Methods
    func describe() {
        print(name + " - ⚔️ \(damage) - 🏥 \(heal)")
    }
}
