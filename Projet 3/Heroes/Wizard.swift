//
//  Wizard.swift
//  Projet 3
//
//  Created by Michael Favre on 02/02/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation

// The healer who is always high!

class Wizard: Hero {
    
    //MARK: -  init
    init(name: String) {
        super.init(name: name, energy: 125, weapon: Hansaplast())
    }
    // Disabling wizard's attack as main function is to heal
    override func attack(target: Hero) {
        print("I'm a lover not a fighter!")
    }
    // Choosing and healing the target
    func heal(target: Hero) {
        target.energy += weapon.heal
        var energyGiven = weapon.heal
        if target.maxEnergy - target.energy < weapon.heal {
            energyGiven = target.maxEnergy - target.energy
        }
        print(name + " has healed " + target.name + " with \(energyGiven) points of energy 🚬🤪")
        
    // Enabling healing limit to avoid going over maximum energy
        if target.energy > 0 {
            if target.energy > target.maxEnergy {
                target.energy = target.maxEnergy
            }
        } else {
            print("What?! You believe you are God?! He's dead!!! FYI it only happened once! And his name was Jesus! 🙄🙄🙄 ")
        }
    }
}

