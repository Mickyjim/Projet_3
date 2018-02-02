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
    let defense: Int
    
    
    //MARK: - Init
    init(name: String, damage: Int, defense: Int) {
        self.name = name
        self.damage = damage
        self.defense = defense
        
    }
    
    //MARK: - Methods
    func describe() {
        print(name + " - ⚔️ \(damage) - 🛡 \(defense) ")
    }
}
