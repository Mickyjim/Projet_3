//
//  Heroes.swift
//  Projet 3
//
//  Created by Michael Favre on 02/02/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation

class Heroes {
    
    //MARK: - Vars
    let name: String
    var energy: Int
    var weapon: Weapons
    
    //MARK: - Init
    init(name: String, energy: Int, weapon: Weapons) {
        self.name = name
        self.energy = energy
        self.weapon = weapon
    }
    
    //MARK: - Methods
    func describe(index: Int) {
        print("\(index+1) - " + name + " - ❤️ \(energy)" + " " +  weapon.name + " " + " - ⚔️ \(weapon.damage)")
    }
    
    //MARK: - Methods - Damage inflicting and lost of energy
    func attack(target: Heroes) {
        target.energy -= weapon.damage
        if target.energy <= 0 {
            target.energy = 0
        }
    }
}


