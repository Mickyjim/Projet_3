//
//  Wizard.swift
//  Projet 3
//
//  Created by Michael Favre on 02/02/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation

// The healer who is always high!

class Wizard: Heroes {
    
    //MARK: -  init
    init(name: String) {
        super.init(name: name, energy: 125, weapon: Hansaplast())
    }
    
    override func attack(target: Heroes) {
        print("I'm a lover not a fighter !")
    }
    
    func heal(target: Heroes) {
        target.energy += weapon.heal
        if target.energy <= 0 {
            print("What?! You believe you are God?! He's dead!!! FYI it only happened once! And his name was Jesus! 🙄🙄🙄 ")
        }
    }
}

