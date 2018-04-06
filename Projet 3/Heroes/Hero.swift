//
//  Heroes.swift
//  Projet 3
//
//  Created by Michael Favre on 02/02/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation

class Hero {
    
    //MARK: - Vars
    let name: String
    var energy: Int
    var weapon: Weapons
    let maxEnergy: Int
    
    //MARK: - Init
    init(name: String, energy: Int, weapon: Weapons) {
        self.name = name
        self.energy = energy
        self.weapon = weapon
        self.maxEnergy = energy
    }
    
    //MARK: - Methods - Hero description
    func describe(index: Int) {
        print("\(index+1) - " + name + " - ❤️ \(energy)" + " " +  weapon.name + " " + " - ⚔️ \(weapon.damage)")
    }
    
    //MARK: - Methods - Damage inflicting and lost of energy
    func attack(target: Hero) {
        if energy > 0 {
            target.energy -= weapon.damage
            print(name + " attacked " + target.name + " and inflicting \(weapon.damage) points of damage! 👊🏻💥😵")
            // Enabling damage limit to avoid going under minimum energy level
            if target.energy < 0 {
                target.energy = 0
            }
        } else {
            print("I can't! Let me rest in peace!")
        }
    }
}


